Mac开发环境


###hosts env

node v10.24.1

npm  v6.14.12

go   v1.16.5


###git clone

https://github.com/OneDays520/ansible-ui.git

###install Task

cd ansible-ui

go install github.com/go-task/task/v3/cmd/task@latest

task deps

###db mysql###

echo "CREATE DATABASE `semaphore` CHARACTER SET utf8 COLLATE utf8_general_ci;" | mysql -uroot -p 

###Compile, set up & run ###

task compile
go run cli/main.go setup

#run

go run cli/main.go --config ./config.json

#or

./run.sh

#build

./build.sh
