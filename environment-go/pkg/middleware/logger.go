package middleware

import (
	"github.com/gofiber/fiber/v2"
)

func Logger(app *fiber.App) {

	// file, err := os.OpenFile("./shared/log/pool.log", os.O_RDWR|os.O_CREATE|os.O_APPEND, 0666)
	// if err != nil {
	// 	log.Fatalf("error opening file: %v", err)
	// }
	// defer file.Close()

	// app.Use(logger.New(logger.Config{Output: file}))
}
