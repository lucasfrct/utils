package middleware

import (
	"log"
	"os"

	logrus "github.com/sirupsen/logrus"
)

type LogProvider struct {
	stdTrace       *log.Logger
	stdDebug       *log.Logger
	stdInfo        *log.Logger
	stdWarn        *log.Logger
	stdError       *log.Logger
	stdFatal       *log.Logger
	stdPanic       *log.Logger
	streamProvider *logrus.Logger
	stream         *os.File
}

func (l *LogProvider) New() {

	l.stdTrace = log.New(os.Stdout, "[TRACE] ", log.Ldate|log.Ltime|log.Llongfile)
	l.stdDebug = log.New(os.Stdout, "[DEBUG] ", log.Ldate|log.Ltime|log.Llongfile)
	l.stdInfo = log.New(os.Stdout, "[INFO]  ", log.Ldate|log.Ltime|log.Lshortfile)
	l.stdWarn = log.New(os.Stdout, "[WARN]  ", log.Ldate|log.Ltime|log.Lshortfile)
	l.stdError = log.New(os.Stdout, "[ERROR] ", log.Ldate|log.Ltime|log.Llongfile)
	l.stdFatal = log.New(os.Stdout, "[FATAL] ", log.Ldate|log.Ltime|log.Llongfile)
	l.stdPanic = log.New(os.Stdout, "[PANIC] ", log.Ldate|log.Ltime|log.Llongfile)

}

func (l *LogProvider) Trace(msg string) {
	l.stdTrace.Println(msg)
	l.OpenStream()
	l.streamProvider.Trace(msg)
	defer l.CloseStream()
}

func (l *LogProvider) Debug(msg string) {
	l.stdDebug.Println(msg)
	l.OpenStream()
	l.streamProvider.Debug(msg)
	defer l.CloseStream()
}

func (l *LogProvider) Info(msg string) {
	l.stdInfo.Println(msg)
	l.OpenStream()
	l.streamProvider.Info(msg)
	defer l.CloseStream()
}

func (l *LogProvider) Warn(msg string) {
	l.stdWarn.Println(msg)
	l.OpenStream()
	l.streamProvider.Warn(msg)
	defer l.CloseStream()
}

func (l *LogProvider) Error(msg string) {
	l.stdError.Println(msg)
	l.OpenStream()
	l.streamProvider.Error(msg)
	defer l.CloseStream()
}

func (l *LogProvider) Fatal(msg string) {
	l.stdFatal.Println(msg)
	l.OpenStream()
	l.streamProvider.Fatal(msg)
	defer l.CloseStream()
}

func (l *LogProvider) Panic(msg string) {
	l.stdPanic.Println(msg)
	l.OpenStream()
	l.streamProvider.Panic(msg)
	defer l.CloseStream()
}

func (l *LogProvider) OpenStream() {

	file, err := os.OpenFile("logs/pool.log", os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0666)
	if err != nil {
		log.Fatal(err)
	}

	l.stream = file
	l.streamProvider = logrus.New()
	l.streamProvider.SetLevel(logrus.TraceLevel)
	l.streamProvider.SetFormatter(&logrus.JSONFormatter{})
	l.streamProvider.SetOutput(l.stream)
}

func (l *LogProvider) CloseStream() {
	defer l.stream.Close()
}

func (l *LogProvider) Test() {
	l.Trace("ON Trace")
	l.Debug("ON Debug")
	l.Info("ON Info")
	l.Warn("ON Warn")
	l.Error("ON Error")
	// l.Fatal("ON Fatal")
	// l.Panic("ON Panic")
}
