FROM golang:1.13.1-alpine3.10 as builder
LABEL maintainer "Newerton Vargas de Araujo <newerton.araujo@gmail.com>"


WORKDIR $GOPATH/src/newerton/golang-codeeducation-rocks/
COPY main.go .
ARG CGO_ENABLED=0
RUN go build -ldflags="-s -w" -o /go/app

FROM scratch
LABEL maintainer "Newerton Vargas de Araujo <newerton.araujo@gmail.com>"

COPY --from=builder /go/app /go/app

CMD ["/go/app"]