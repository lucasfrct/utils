package utils

import (
	"fmt"
	"os"
	"os/signal"
	"strconv"
	"strings"
	"syscall"
	"time"

	"github.com/gofiber/fiber/v2"
	"github.com/rs/zerolog"
	"github.com/rs/zerolog/pkgerrors"
	"gopkg.in/natefinch/lumberjack.v2"
)

const (
	PathName     string = "logs/pool.log"
	MaxSizeFile  int    = 512  // 512 MB
	MaxDaysFile  int    = 28   // dias que dura um arquivo
	MaxBackups   int    = 3    // máximo de backups armazenados
	CompressFile bool   = true // comprimir o arquivo
)

var StaticCaller string
var StaticError error

func LogProvider(app *fiber.App) {
	app.Use(func(c *fiber.Ctx) error {
		c.Locals("logger", Logger())
		return c.Next()
	})
}

func Logger() *zerolog.Logger {
	Provider := LoggerProvider{}
	logger := Provider.New()

	return logger
}

type LoggerProviderHook struct {
	loggerStream zerolog.Logger
	loggerEvent  *zerolog.Event
}

func (lph *LoggerProviderHook) Run(e *zerolog.Event, level zerolog.Level, msg string) {

	lph.LoggerStream(level.String(), msg)
}

func (lph *LoggerProviderHook) LoggerStream(level, msg string) *zerolog.Logger {

	configStreamOut := &lumberjack.Logger{
		Filename:   PathName,
		MaxSize:    MaxSizeFile,
		MaxBackups: MaxBackups,
		MaxAge:     MaxDaysFile,
		Compress:   CompressFile,
	}

	lph.loggerStream = zerolog.New(configStreamOut).With().Logger()

	lph.HandleLevel(level)
	lph.AddDateTime()
	lph.AddCaller().Msg(msg)

	c := make(chan os.Signal, 1)
	signal.Notify(c, syscall.SIGHUP)

	go func() {
		for {
			<-c
			configStreamOut.Rotate()
		}
	}()

	return &lph.loggerStream
}

func (lph *LoggerProviderHook) AddDateTime() *zerolog.Event {
	return lph.loggerEvent.Str("time", time.Now().UTC().String())
}

func (lph *LoggerProviderHook) AddCaller() *zerolog.Event {

	if strings.TrimSpace(StaticCaller) == "" || len(StaticCaller) == 0 {
		return lph.loggerEvent
	}

	return lph.loggerEvent.Str("caller", StaticCaller)
}

func (lph *LoggerProviderHook) HandleLevel(level string) *zerolog.Event {

	switch strings.ToLower(level) {
	case "trace":
		lph.loggerEvent = lph.loggerStream.Panic().Stack().Err(StaticError)
	case "debug":
		lph.loggerEvent = lph.loggerStream.Debug().Stack().Err(StaticError)
	case "info":
		lph.loggerEvent = lph.loggerStream.Info().Stack().Err(StaticError)
	case "warn":
		lph.loggerEvent = lph.loggerStream.Warn().Stack().Err(StaticError)
	case "error":
		lph.loggerEvent = lph.loggerStream.Error().Stack().Err(StaticError)
	case "fatal":
		lph.loggerEvent = lph.loggerStream.Fatal().Stack().Err(StaticError)
	case "panic ":
		lph.loggerEvent = lph.loggerStream.Panic().Stack().Err(StaticError)
	default:
		lph.loggerEvent = lph.loggerStream.Log().Str("level", "log").Stack().Err(StaticError)
	}
	return lph.loggerEvent
}

type LoggerProvider struct {
	instance  zerolog.Logger
	stdOut    zerolog.ConsoleWriter
	streamOut zerolog.Logger
}

func (l *LoggerProvider) New() *zerolog.Logger {

	var loggerProviderHook LoggerProviderHook

	zerolog.TimeFieldFormat = zerolog.TimeFormatUnix

	stdOut := l.StdOut()

	l.instance = zerolog.New(stdOut).With().Timestamp().Caller().Logger().Hook(&loggerProviderHook)

	return &l.instance
}

func (l *LoggerProvider) StdOut() *zerolog.ConsoleWriter {

	zerolog.TimeFieldFormat = zerolog.TimeFormatUnix

	zerolog.CallerMarshalFunc = func(file string, line int) string {
		caller := file + ":" + strconv.Itoa(line)
		StaticCaller = caller
		return caller
	}

	zerolog.ErrorStackMarshaler = func(err error) interface{} {
		StaticError = err
		// return fmt.Sprintf("%+v", err)
		return pkgerrors.MarshalStack(err)
	}

	l.stdOut = zerolog.ConsoleWriter{Out: os.Stdout, TimeFormat: time.RFC3339}

	l.stdOut.FormatLevel = func(i interface{}) string {
		return strings.ToUpper(fmt.Sprintf("[%v]", i))
	}

	l.stdOut.FormatMessage = func(i interface{}) string {
		return fmt.Sprintf(" %s ", i)
	}

	l.stdOut.FormatFieldName = func(i interface{}) string {
		return fmt.Sprintf("%s:", i)
	}

	return &l.stdOut
}
