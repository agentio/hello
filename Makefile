
build:
	go install ./...

protos:
	go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
	go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
	protoc helloworld/helloworld.proto --go_out=. --go-grpc_out=.

descriptor:
	protoc \
		--include_imports \
		--include_source_info \
		--descriptor_set_out descriptor.pb \
		helloworld/helloworld.proto


service:
	gcloud endpoints services deploy descriptor.pb api_config.yaml
