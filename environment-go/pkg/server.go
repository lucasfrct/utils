package pkg

import (
	"fmt"
	"log"
	"os"
	"os/signal"
	"strconv"
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

func (s *Server) Listen(arg ...int) {

	idleConnsClosed := make(chan struct{})

	go func() {
		sigint := make(chan os.Signal, 1)
		signal.Notify(sigint, os.Interrupt) // Catch OS signals.
		<-sigint

		if err := s.instance.Shutdown(); err != nil {
			log.Printf("O Server foi derrubado: %v", err)
		}

		close(idleConnsClosed)
	}()

	if len(arg) > 0 {
		os.Setenv("GOPORT", strconv.Itoa(arg[0]))
	}

	now := time.Now().UTC()

	fmt.Println("#")
	fmt.Println("# $TZ: ", os.Getenv("TZ"))
	fmt.Println("# $GOPORT: ", os.Getenv("GOPORT"))
	fmt.Println("# $APP_HOME: ", os.Getenv("APP_HOME"))
	fmt.Println("# Server UP: ", now.Format("2006-01-02 15:04:05"), "UTC")
	fmt.Println("")

	err := s.instance.Listen(":" + os.Getenv("GOPORT"))
	if err != nil {
		log.Printf("O Server foi derrubado: %v", err)
	}

	<-idleConnsClosed
}

func (s *Server) Routes(routes func(*fiber.App)) {
	defer routes(s.instance)
}

func (s *Server) Middlewares(middleware func(*fiber.App)) {
	defer middleware(s.instance)
}
