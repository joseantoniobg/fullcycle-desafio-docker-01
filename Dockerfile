FROM golang:alpine AS builder

WORKDIR /src
COPY . .
RUN go build -ldflags '-s -w' hello.go

FROM scratch

WORKDIR /
COPY --from=builder /src /
CMD ["./hello"]
