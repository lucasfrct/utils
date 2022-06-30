package routes

import (
	"github.com/gofiber/fiber/v2"
	"github.com/lucasfrct/environment-go/pkg/middleware"
)

func internalError(c *fiber.Ctx) error {

	response := middleware.Response{}
	return response.ErrorDefault(c, "XXX000")
}
