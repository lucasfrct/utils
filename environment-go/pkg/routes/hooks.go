package routes

import (
	"fmt"
	"time"

	"github.com/gofiber/fiber/v2"
	"github.com/lucasfrct/environment-go/pkg/middleware"
)

func hooks(c *fiber.Ctx) error {

	now := time.Now().UTC()
	result := fmt.Sprintf("Listening: %s", now.Format("2006-01-02 15:04:05"))

	response := middleware.Response{}
	return response.Result(c, 200, result)
}
