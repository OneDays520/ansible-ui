Mac开发环境


#ENV

node v10.24.1

npm  v6.14.12

go   v1.16.5


#git clone
http://192.168.4.134/test/ansible-ui.git

#install task
cd ansible-ui
go install github.com/go-task/task/v3/cmd/task@latest
task deps

#db mysql

echo "create database semaphore;" | mysql -uroot -p

#Compile, set up & run
task compile
go run cli/main.go setup

#run
go run cli/main.go --config ./config.json

#or
./run.sh

#build

./build.sh
