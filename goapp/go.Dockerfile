FROM golang:1.21-alpine3.18 AS build

WORKDIR /app

COPY main.go .

RUN go mod tidy

RUN CGO_ENABLED=0 GOOS=linux go build -o main .


FROM alpine:3.22

WORKDIR /app

COPY --from=build /app/main .

EXPOSE 8080

CMD ["./main"]