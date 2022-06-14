FROM golang:1.18 as builder

WORKDIR /go/src/github.com/ppc64le-cloud/prow-plugins
COPY . .

RUN CGO_ENABLED=0 go install ./...

FROM alpine:3.16

COPY --from=builder /go/bin/ /