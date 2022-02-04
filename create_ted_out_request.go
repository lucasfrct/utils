package lib

import (
	"errors"
	"regexp"
	"time"

	"github.com/Nhanderu/brdoc"
	"github.com/qgx-pagamentos/qgx-payment-util-go/str"
	"github.com/qgx-pagamentos/qgx-payment-util-go/types"
)

//CreateTEDOutRequest - envia TED
type CreateTEDOutRequest struct {
	BankNumber       string                `json:"bank_number,omitempty"`
	BankAgency       string                `json:"bank_agency,omitempty"`
	BankAccount      string                `json:"bank_account,omitempty"`
	BankAccountDigit string                `json:"bank_account_digit,omitempty"`
	BankType         types.BankAccountType `json:"bank_type,omitempty"`
	Document         string                `json:"document,omitempty"`
	Name             string                `json:"name,omitempty"`
	Description      string                `json:"description,omitempty"`
	PaymentAt        string                `json:"payment_at,omitempty"`
	Amount           uint                  `json:"amount,omitempty"`
}

//Validate - valida dados
func (c *CreateTEDOutRequest) Validate() (bool, error) {
	if c.Amount < 1 {
		return false, errors.New("O valor mínimo é de R$ 0,01 (ou equivalente na moeda do país). A quantia deve ser um número inteiro positivo em centavos que representa quanto cobrar, por exemplo, 100 por R$ 1,00")
	}
	if str.IsEmpty(&c.BankNumber) {
		return false, errors.New("Número do banco é obrigatório")
	}
	if str.IsEmpty(&c.BankAgency) {
		return false, errors.New("Agência é obrigatória")
	}
	if str.IsEmpty(&c.BankAccount) {
		return false, errors.New("Conta é obrigatória")
	}
	if str.IsEmpty(&c.BankAccountDigit) {
		return false, errors.New("Dígito da conta é obrigatória")
	}

	c.BankNumber = regexp.MustCompile(`\D`).ReplaceAllString(c.BankNumber, "")
	c.BankAgency = regexp.MustCompile(`\D`).ReplaceAllString(c.BankAgency, "")
	c.BankAccount = regexp.MustCompile(`\D`).ReplaceAllString(c.BankAccount, "")
	c.BankAccountDigit = regexp.MustCompile(`\D`).ReplaceAllString(c.BankAccountDigit, "")

	if c.BankType == "" || c.BankType == types.BankAccountTypeNone {
		c.BankType = types.BankAccountTypeChecking
	}

	if str.IsEmpty(&c.Document) {
		return false, errors.New("Documento do favorecido é obrigatório")
	}
	c.Document = regexp.MustCompile(`\D`).ReplaceAllString(c.Document, "")
	if !brdoc.IsCPF(c.Document) && !brdoc.IsCNPJ(c.Document) {
		return false, errors.New("Documento do favorecido não é um documento válido")
	}
	if str.IsEmpty(&c.Name) {
		return false, errors.New("Nome do favorecido é obrigatório")
	}
	if c.Amount < 100 {
		return false, errors.New("O valor mínimo é de R$ 1 (ou equivalente na moeda do país). A quantia deve ser um número inteiro positivo em centavos que representa quanto cobrar, por exemplo, 100 por R$ 1,00")
	}
	if !str.IsEmpty(&c.PaymentAt) {
		_, e := time.Parse("2006-01-02", c.PaymentAt)
		if e != nil {
			return false, errors.New("Data da transferência inválida. (yyyy-mm-dd)")
		}
	}

	if len(c.BankAgency) > 4 {
		return false, errors.New("Agência destino não possui um valor válido")
	}

	return true, nil
}
