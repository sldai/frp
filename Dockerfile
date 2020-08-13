FROM alpine

RUN apk add --update tzdata
ENV TZ=America/Los_Angeles

ENV FRP_VERSION 0.24.0
RUN wget https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && tar -xf frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && mkdir /frp \
    && cp frp_${FRP_VERSION}_linux_amd64/frp* /frp/ \
    && rm -rf frp_${FRP_VERSION}_linux_amd64*

# Clean APK cache
RUN rm -rf /var/cache/apk/*

RUN mkdir /conf

ENV TYPE=frps

WORKDIR /frps
ENTRYPOINT ["./${TYPE}","-c","/conf/${TYPE}.ini"]