package main

import (
	"github.com/lucasfrct/environment-go/pkg"
	"github.com/lucasfrct/environment-go/pkg/middleware"
	"github.com/lucasfrct/environment-go/pkg/routes"
)

func main() {

	server := pkg.Server{}
	server.New()
	server.Routes(routes.PrivateRoutes)
	server.Middlewares(middleware.Cors)
	server.Middlewares(middleware.Logger)

	server.Listen(9000)

}
