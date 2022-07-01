package middleware

import "github.com/gofiber/fiber/v2"

type Response struct {
}

func (r *Response) Result(c *fiber.Ctx, status int, data any) error {
	return c.Status(status).JSON(data)
}

func (r *Response) Error(c *fiber.Ctx, status int, code string, message string) error {
	return c.Status(status).JSON(map[string]string{
		"code":    code,
		"message": message,
	})
}

func (r *Response) ErrorDefault(c *fiber.Ctx, code string) error {
	return r.Error(c, 500, code, "Serviço indisponível no momento. Tente novamente mais tarde.")
}
