package main

import (
	"fmt"
	"os"

	"github.com/lucasfrct/environment-go/pkg"
	"github.com/lucasfrct/environment-go/pkg/middleware"
	"github.com/lucasfrct/environment-go/pkg/routes"
)

func main() {

	server := pkg.Server{}
	server.New()
	server.Routes(routes.PrivateRoutes)
	server.Middlewares(middleware.Cors)
	// server.Middlewares(middleware.Logger)

	port := os.Getenv("GOPORT")
	fmt.Println("port: ", port)

	server.Listen(port)

}
