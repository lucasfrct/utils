package main

import (
	"fmt"
	"os"
)

func main() {

	port := os.Getenv("GOPORT")

	gopath := os.Getenv("GOPATH")
	gobin := os.Getenv("GOBIN")
	goprivate := os.Getenv("GOPRIVATE")
	goroot := os.Getenv("GOROOT")
	gopkg := os.Getenv("GOPKG")

	fmt.Println("")
	fmt.Println("PORT: ", port)
	fmt.Println("GOPATH: ", gopath)
	fmt.Println("GOBIN: ", gobin)
	fmt.Println("GOPKG: ", gopkg)
	fmt.Println("GOROOT: ", goroot)
	fmt.Println("GOPRIVATE: ", goprivate)

}
