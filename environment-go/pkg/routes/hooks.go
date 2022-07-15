package routes

import (
	"fmt"
	"time"

	"github.com/gofiber/fiber/v2"
	"github.com/lucasfrct/environment-go/pkg/utils"
)

func hooks(ctx *fiber.Ctx) error {

	now := time.Now().UTC()
	result := fmt.Sprintf("Listening: %s", now.Format("2006-01-02 15:04:05"))

	return utils.Response(ctx).Json(utils.Result(200, result))
}
