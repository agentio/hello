
build:
	go install ./...

protos:
	go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
	go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
	protoc helloworld/helloworld.proto --go_out=. --go-grpc_out=.

