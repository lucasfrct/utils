package utils

import (
	"errors"
	"io/ioutil"
)

type ReadJson struct {
	file string //
}

func (r *ReadJson) Run(file string) ([]byte, error) {

	if file != "" {
		r.file = file
	}

	if r.file == "" {
		return nil, errors.New(" File not found")
	}

	jsonFile, err := ioutil.ReadFile(r.file)
	if err != nil {
		return nil, err
	}

	return jsonFile, nil

}
