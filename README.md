Mac开发环境


###主机环境

node: v10.24.1
npm : v6.14.12
go  : v1.16.5


###git clone

http://192.168.4.134/test/ansible-ui.git

###install Task

cd ansible-ui
go install github.com/go-task/task/v3/cmd/task@latest
task deps

###db mysql###

echo "CREATE DATABASE `semaphore` CHARACTER SET utf8 COLLATE utf8_general_ci;" | mysql -uroot -p 

###Compile & setup & run ###

#Compile
task compile

#Setup
go run cli/main.go setup

#run
go run cli/main.go --config ./config.json

#or
./run.sh

#build
./build.sh
