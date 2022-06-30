package config

import (
	"os"
	"strconv"
	"time"

	"github.com/gofiber/fiber/v2"
)

func Server() fiber.Config {

	readTimeoutSecondsCount, _ := strconv.Atoi(os.Getenv("SERVER_READ_TIMEOUT"))

	return fiber.Config{
		ReadTimeout:  time.Second * time.Duration(readTimeoutSecondsCount),
		ServerHeader: "Enviroment-go",
		AppName:      "Enviroment-go",
		Prefork:      true,
		// CaseSensitive: true,
		// StrictRouting: true,
	}
}
