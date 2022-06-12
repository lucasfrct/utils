package routes

import (
	"github.com/gofiber/fiber/v2"
)

func PrivateRoutes(app *fiber.App) {

	route := app.Group("/api/v1")

	/**
	* verifica se o servidor está online
	* @api {get} /health
	 */
	route.Get("/health", health)
	app.Get("/health", health)

	/**
	* verifica se o hook está online
	* @api {post} /hooks
	 */
	route.Post("/hooks", hooks)
	app.Post("/hokks", hooks)

}
