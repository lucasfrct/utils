package config

import (
	"os"
	"strconv"
	"time"

	"github.com/gofiber/fiber/v2"
)

func Server() fiber.Config {

	readTimeoutSecondsCount, _ := strconv.Atoi(os.Getenv("SERVER_READ_TIMEOUT"))

	// SET TIMEZONE ENVIRONMENT
	setTimeZone("America/Sao_Paulo")

	// SET GOPORt ENVIRONMENT
	setPort(9000)

	return fiber.Config{
		ReadTimeout:  time.Second * time.Duration(readTimeoutSecondsCount),
		ServerHeader: "Enviroment-go",
		AppName:      "Enviroment-go",
		Prefork:      true,
		// CaseSensitive: true,
		// StrictRouting: true,
	}
}

func setTimeZone(arg ...string) string {

	timezone := "America/Sao_Paulo"

	tz := os.Getenv("GOTIMEZONE")
	if tz != "" {
		timezone = tz
	}

	if len(arg) > 0 {
		timezone = arg[0]
	}

	os.Setenv("TZ", timezone)

	return timezone
}

func setPort(arg ...int) int {

	port := 9000

	portEnv, err := strconv.ParseInt(os.Getenv("GOPORT"), 0, 8)
	if err == nil {
		port = int(portEnv)
	}

	if len(arg) > 0 {
		port = arg[0]
	}

	os.Setenv("GOPORT", strconv.Itoa(port))

	return port
}
