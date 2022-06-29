package pkg

import (
	"fmt"
	"log"
	"os"
	"sync"
	"time"

	"github.com/gofiber/fiber/v2"
	"github.com/lucasfrct/environment-go/pkg/config"
)

type Server struct {
	instance *fiber.App
}

func (s *Server) New() *fiber.App {
	config := config.Server()

	var lock = &sync.Mutex{}
	if s.instance == nil {
		lock.Lock()
		defer lock.Unlock()

		if s.instance == nil {
			s.instance = fiber.New(config)
		}
	}

	return s.instance
}

func (s *Server) Listen(port string) {

	now := time.Now().UTC()

	fmt.Println("#")
	fmt.Println("# $TZ: ", os.Getenv("TZ"))
	fmt.Println("# $PORT: ", port)
	fmt.Println("# $APP_HOME: ", os.Getenv("APP_HOME"))
	fmt.Println("# Server UP: ", now.Format("2006-01-02 15:04:05"), "UTC")
	fmt.Println("")

	err := s.instance.Listen(":" + port)
	if err != nil {
		log.Printf("O Server foi derrubado: %v", err)
	}
}

func (s *Server) Routes(routes func(*fiber.App)) {
	defer routes(s.instance)
}

func (s *Server) Middlewares(middleware func(*fiber.App)) {
	defer middleware(s.instance)
}
