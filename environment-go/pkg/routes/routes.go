package routes

import (
	"github.com/gofiber/fiber/v2"
)

func PrivateRoutes(app *fiber.App) {

	route := app.Group("/api/v1")

	/**
	* verifica se o servidor está online
	 */
	route.Get("/health", health)

	/**
	* verifica se o hook está online
	 */
	route.Post("/hooks/health", hooks)

	/**
	* retorna erro 404 para qualquer requiscao invalida
	 */
	app.Use("/", notFound)

}
