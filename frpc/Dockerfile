FROM alpine

RUN apk add --update tzdata
ENV TZ=America/Los_Angeles

ENV FRP_VERSION 0.24.0
RUN wget https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && tar -xf frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && mkdir /frpc \
    && cp frp_${FRP_VERSION}_linux_amd64/frpc* /frpc/ \
    && rm -rf frp_${FRP_VERSION}_linux_amd64*

# Clean APK cache
RUN rm -rf /var/cache/apk/*

RUN mkdir /conf
COPY conf/frpc.ini /frpc/

WORKDIR /frpc
ENTRYPOINT ["./frpc","-c","/conf/frpc.ini"]