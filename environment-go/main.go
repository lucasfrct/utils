package main

import (
	"fmt"
	"os"
)

func main() {

	gopath := os.Getenv("GOPATH")
	gobin := os.Getenv("GOBIN")
	goprivate := os.Getenv("GOPRIVATE")
	goroot := os.Getenv("GOROOT")

	fmt.Println("GOPATH:", gopath)
	fmt.Println("GOBIN", gobin)
	fmt.Println("GOPRIVATE: ", goprivate)
	fmt.Println("GOROOT: ", goroot)

}
