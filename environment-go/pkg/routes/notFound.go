package routes

import (
	"github.com/gofiber/fiber/v2"
	"github.com/lucasfrct/environment-go/pkg/utils"
)

func notFound(ctx *fiber.Ctx) error {

	return utils.Response(ctx).Json(utils.Error(404, "XXX000", "Recurso não encontrado."))
}
