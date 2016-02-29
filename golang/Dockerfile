FROM golang:1.5

MAINTAINER d-abe <abe@flup.jp>

ENV GO15VENDOREXPERIMENT 1

RUN go get -u gopkg.in/godo.v2/cmd/godo

WORKDIR /go/src/app

EXPOSE 8080

CMD ["/go/bin/godo", "server", "--watch"]
