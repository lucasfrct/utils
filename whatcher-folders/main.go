package main

import (
	"fmt"
	"log"
	"strings"

	"github.com/fsnotify/fsnotify"
)

type function func(interface{}) interface{}

func contains(srtArray []string, str string) bool {
	for _, st := range srtArray {
		if st == str {
			return true
		}
	}
	return false
}

func String(n int32) string {
	buf := [11]byte{}
	pos := len(buf)
	i := int64(n)
	signed := i < 0
	if signed {
		i = -i
	}
	for {
		pos--
		buf[pos], i = '0'+byte(i%10), i/10
		if i == 0 {
			if signed {
				pos--
				buf[pos] = '-'
			}
			return string(buf[pos:])
		}
	}
}

type Event struct {
	action     string
	path       string
	subscribed []string
	actions    []string
}

func (e *Event) New(action, path string, fn function) bool {

	e.action = strings.ToLower(strings.TrimSpace(action))
	e.path = strings.ToLower(strings.TrimSpace(path))

	e.actions = []string{"create", "remove", "modify", "all"}

	label := e.action + "|" + e.path

	if !contains(e.actions, e.action) {
		fmt.Println("Action invílida: ", e.action)
		return false
	}

	if contains(e.subscribed, label) {
		fmt.Println("Evento já subscrito: ", label)
		return false
	}

	e.subscribed = append(e.subscribed, label)

	e.run(fn)

	return true

}

func (e *Event) reMap(op string) string {
	switch op {
	case "CREATE":
		return "create"
	case "RENAME":
		return "remove"
	case "WRITE":
		return "modify"
	}
	return "all"
}

func (e *Event) run(fn function) {

	watcher, err := fsnotify.NewWatcher()
	if err != nil {
		log.Fatal("New Watcher failed: ", err)
	}
	defer watcher.Close()

	done := make(chan bool)

	go func() {
		defer close(done)

		for {
			select {
			case event, ok := <-watcher.Events:
				if !ok {
					return
				}

				fmt.Println("DEBUG: ", event.Name, event.Op)

			case err, ok := <-watcher.Errors:
				if !ok {
					return
				}
				log.Println("error:", err)
			}
		}
	}()

	err = watcher.Add(e.path)
	if err != nil {
		log.Fatal("Add failed:", err)
	}
	<-done
}

func main() {
	ev := Event{}

	ev.New("create", "./", func(event interface{}) interface{} {
		fmt.Println("Trigger: ", event.(string))
		return event.(string)
	})

	ev.New("modify", "./", func(event interface{}) interface{} {
		fmt.Println("Trigger: ", event.(string))
		return event.(string)
	})
}
