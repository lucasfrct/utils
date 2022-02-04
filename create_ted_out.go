package rest

import (
	"encoding/json"

	"github.com/qgx-pagamentos/qgx-payment-ip-transfers-service-go/lib"
	"github.com/qgx-pagamentos/qgx-payment-util-go/api"
	"github.com/qgx-pagamentos/qgx-payment-util-go/chain"
	"github.com/qgx-pagamentos/qgx-payment-util-go/cls"
	"github.com/qgx-pagamentos/qgx-payment-util-go/logf"
	"github.com/qgx-pagamentos/qgx-payment-util-go/rule"
	"github.com/qgx-pagamentos/qgx-payment-util-go/types"
	"github.com/valyala/fasthttp"
)

// createTEDOut - envia TED externo
func (srv *InternalViewsService) createTEDOut(ctx *fasthttp.RequestCtx) {
	logs := logf.InitLoggers(ctx)

	claims, ok := ctx.UserValue("claims").(chain.Claims)
	if !ok {
		responseWithError(ctx, fasthttp.StatusUnauthorized, "Serviço indisponível no momento. Por favor, tente novamente em alguns instantes.", "TF0012")
		return
	}

	integration := srv.getPartner(ctx).(api.BaasIntegration)
	if integration == nil {
		responseWithError(ctx, fasthttp.StatusUnauthorized, "Serviço indisponível no momento. Por favor, tente novamente em alguns instantes.", "TF0013")
		return
	}

	var tedRequest lib.CreateTEDOutRequest
	if e := json.Unmarshal(ctx.PostBody(), &tedRequest); e != nil {
		logs.PrintlogError(e.Error())
		responseWithError(ctx, fasthttp.StatusBadRequest, "Erro recebendo dados", "TF0015")
		return
	}

	if _, e := tedRequest.Validate(); e != nil {
		logs.PrintlogError(e.Error())
		responseWithError(ctx, fasthttp.StatusBadRequest, e.Error(), "TF0016")
		return
	}

	permission := "transfers_tedout_same"
	if cls.Document(claims.UUID) != tedRequest.Document {
		permission = "transfers_tedout_others"
	}

	// Função usada para validar todas as regras de risco e permissão
	if e := rule.ValidateAll(claims.UUID, permission, svcDynamodb); e != nil {
		logs.PrintlogError(e.Error())
		responseWithError(ctx, fasthttp.StatusBadRequest, "Operação não autorizada. Entre em contato com o suporte.", "TF0035")
		return
	}

	if e := rule.RiskDocumentBlocked(tedRequest.Document, types.BlockedActionToReceive, svcDynamodb); e != nil {
		logs.PrintlogError(e.Error())
		responseWithError(ctx, fasthttp.StatusBadRequest, "Operação não autorizada. Entre em contato com o suporte.", "TF0036")
		return
	}

	dst := api.BankWithRecipient{}
	dst.Document = tedRequest.Document
	dst.Name = tedRequest.Name
	dst.Type = string(tedRequest.BankType)
	dst.Number = tedRequest.BankNumber
	dst.Agency = tedRequest.BankAgency
	dst.Account = tedRequest.BankAccount
	dst.Digit = tedRequest.BankAccountDigit

	result, err := integration.ScheduledTedOut(claims.UUID, dst, tedRequest.Amount, tedRequest.Description, tedRequest.PaymentAt)
	if err != nil {
		logs.PrintlogError(err.String())
		responseWithError(ctx, err.Status, err.Message, err.Code)
		return
	}

	responseWith(ctx, fasthttp.StatusOK, result)
}
