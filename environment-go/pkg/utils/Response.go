package utils

import "github.com/gofiber/fiber/v2"

func Response(ctx *fiber.Ctx) *ResponseProvider {
	return &ResponseProvider{ctx: ctx}
}

func Result(status int, data ...any) *ResultProvider {
	if len(data) > 0 {
		return &ResultProvider{Status: status, Data: data[0]}
	}
	return &ResultProvider{Status: status}
}

func Error(status int, code, message string) *ResultProvider {
	return &ResultProvider{Status: status, Code: code, Message: message}
}

func ErrorDefault(code string) *ResultProvider {
	return Error(500, "AAAXXX", "Serviço indisponível no momento. Tente novamente mais tarde.")
}

type ResultProvider struct {
	Status  int    `json:"status"`
	Data    any    `json:"data"`
	Code    string `json:"code"`
	Message string `json:"message"`
}

func (r *ResultProvider) Success() (Status int, Data any) {
	return r.Status, r.Data
}

func (r *ResultProvider) Error() (Status int, Code string, Message string) {
	return r.Status, r.Code, r.Message
}

type ResponseProvider struct {
	ctx    *fiber.Ctx
	Status int
	Result any
}

func (r *ResponseProvider) handleStatus(status int) int {

	if status == 201 {
		return fiber.StatusCreated
	}

	if status == 204 {
		return fiber.StatusNoContent
	}

	if status == 401 {
		return fiber.StatusUnauthorized
	}

	if status == 0 || status < 100 {
		return fiber.StatusInternalServerError
	}

	if status < 200 {
		return fiber.StatusContinue
	}

	if status < 300 {
		return fiber.StatusOK
	}

	if status < 400 {
		return fiber.StatusMultipleChoices
	}

	if status < 500 {
		return fiber.StatusBadRequest
	}

	if status >= 500 {
		return fiber.StatusInternalServerError
	}

	return fiber.StatusInternalServerError
}

func (r *ResponseProvider) handleMaessage(result *ResultProvider) any {

	if r.Status == fiber.StatusOK {
		if result.Data != nil {
			return result.Data
		}
		return nil
	}

	if r.Status == fiber.StatusCreated || r.Status == fiber.StatusNoContent {
		return nil
	}

	if r.Status >= 400 {
		return fiber.Map{"code": result.Code, "message": result.Message}
	}

	return nil
}

func (r *ResponseProvider) Json(response *ResultProvider) error {
	r.Status = r.handleStatus(response.Status)
	r.Result = r.handleMaessage(response)
	return r.ctx.Status(r.Status).JSON(r.Result)
}
