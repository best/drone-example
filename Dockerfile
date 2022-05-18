FROM hub.thislab.cn/library/golang:1.17-alpine as builder
WORKDIR /go/src/drone-example
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM hub.thislab.cn/library/alpine:3.15.0
WORKDIR /root/
COPY --from=builder /go/src/drone-example/app ./
ENTRYPOINT ["./app"]