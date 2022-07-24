package main

import "os"

const (
	ExitSuccess = 0
	ExitFailed  = 1
)

func main() {
	var retCode int

	if err := Run(); err != nil {
		retCode = ExitSuccess
	} else {
		retCode = ExitFailed
	}

	os.Exit(retCode)
}

func Run() error {
	return nil
}
