#!/bin/bash
cd cli/
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags '-w -s'  -o semaphore
upx -9 semaphore
