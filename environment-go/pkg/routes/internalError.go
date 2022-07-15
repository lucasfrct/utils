package routes

import (
	"github.com/gofiber/fiber/v2"
	"github.com/lucasfrct/environment-go/pkg/utils"
)

func internalError(ctx *fiber.Ctx) error {

	return utils.Response(ctx).Json(utils.ErrorDefault("XXX000"))
}
