FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
ENV RELAY_SERVER_ADDR="lan.teknik.app:11451"
RUN apt update && apt install -y libpcap0.8 libuv1 curl && rm -rf /var/lib/apt/lists/* && mkdir /app && cd /app && curl -OL https://github.com/spacemeowx2/switch-lan-play/releases/download/v0.2.3/lan-play-linux && chmod +x lan-play-linux
ENTRYPOINT /app/lan-play-linux --relay-server-addr "${RELAY_SERVER_ADDR}"
