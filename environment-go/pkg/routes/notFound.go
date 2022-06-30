package routes

import (
	"github.com/gofiber/fiber/v2"
	"github.com/lucasfrct/environment-go/pkg/middleware"
)

func notFound(c *fiber.Ctx) error {

	response := middleware.Response{}
	return response.Error(c, 404, "XXX000", "Recurso não encontrado.")
}
