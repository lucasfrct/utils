package main

import (
	"os"

	"github.com/lucasfrct/environment-go/pkg"
	"github.com/lucasfrct/environment-go/pkg/middlewares"
	"github.com/lucasfrct/environment-go/pkg/routes"
)

func main() {

	server := pkg.Server{}
	server.New()
	server.Middlewares(middlewares.Cors)
	server.Routes(routes.PrivateRoutes)

	port := os.Getenv("GOPORT")
	server.Listen(port)

}
