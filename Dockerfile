FROM golang:1.22.5 as builder
WORKDIR /app
COPY . ./
RUN CGO_ENABLED=0 GOOS=linux go build -v -o ./hello-server/hello-server ./hello-server

FROM alpine:3.14
COPY --from=builder /app/hello-server/hello-server /usr/local/bin/hello-server
EXPOSE 8080
ENV PORT 8080
ENTRYPOINT ["/usr/local/bin/hello-server"]

