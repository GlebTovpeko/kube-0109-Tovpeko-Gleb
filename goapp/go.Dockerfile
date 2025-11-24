FROM golang:1.24.2 AS builder

WORKDIR /app

COPY go.mod .
COPY main.go .

RUN go mod tidy

RUN go build -o main .


FROM alpine:3.22

WORKDIR /app

COPY --from=builder /app/main .

EXPOSE 8080

CMD ["./main"]