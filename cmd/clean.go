package main

import (
	"github.com/yeo/betterdev.link/baja"
	"log"
	"os"
)

func clean(action string) {
	cwd, err := os.Getwd()
	if err != nil {
		log.Fatal("Cannot fetch current dir", err)
		return
	}

	baja.Clean(action, cwd)
}
