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
	gopkg := os.Getenv("GOPKG")

	// u := uuid.New().String()

	fmt.Println("GOPATH: ", gopath)
	fmt.Println("GOBIN: ", gobin)
	fmt.Println("GOPRIVATE: ", goprivate)
	fmt.Println("GOROOT: ", goroot)
	fmt.Println("GOPKG: ", gopkg)
	// fmt.Println("GOPKG: ", gopkg)

	// fmt.Println("UUID: ", u)

}
