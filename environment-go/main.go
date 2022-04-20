package main

import (
	"fmt"
	"os"
)

func main() {

	port := os.Getenv("GOPORT")
	project := os.Getenv("PATH_PROJECT")
	path := os.Getenv("PATH")

	gopath := os.Getenv("GOPATH")
	gobin := os.Getenv("GOBIN")
	gopkg := os.Getenv("GOPKG")
	gosrc := os.Getenv("GOSRC")
	goprivate := os.Getenv("GOPRIVATE")
	goroot := os.Getenv("GOROOT")

	fmt.Println("")
	fmt.Println("PORT: ", port)
	fmt.Println("GOPATH: ", gopath)
	fmt.Println("GOBIN: ", gobin)
	fmt.Println("GOPKG: ", gopkg)
	fmt.Println("GOSRC: ", gosrc)
	fmt.Println("GOROOT: ", goroot)
	fmt.Println("GOPRIVATE: ", goprivate)
	fmt.Println("PATH_PROJECT: ", project)
	fmt.Println("PATH: ", path)

}
