FROM alpine:latest as builder

RUN apk update && apk add go git gcc libc-dev

RUN mkdir /go
ENV GOPATH /go
COPY minibank/ $GOPATH
RUN go get -t minibank
RUN go install minibank
WORKDIR /go

FROM alpine:latest
WORKDIR /go
COPY --from=builder /go/bin/minibank .
CMD ["./minibank"]

