FROM golang:alpine3.18 as build

WORKDIR /
COPY . .
RUN go build -ldflags '-s -w' hello.go

FROM scratch

WORKDIR /app
COPY --from=build / /app
CMD ["./hello"]