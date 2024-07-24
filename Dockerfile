FROM golang:1.22.5 as builder
WORKDIR /app
COPY . ./
RUN CGO_ENABLED=0 GOOS=linux go build -v -o hello-server ./cmd/hello-server

FROM alpine:3.14
COPY --from=builder /app/hello-server /usr/local/bin/hello-server
ENTRYPOINT ["/usr/local/bin/hello-server"]

