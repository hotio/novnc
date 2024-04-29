ARG UPSTREAM_IMAGE
ARG UPSTREAM_DIGEST_AMD64

FROM ${UPSTREAM_IMAGE}@${UPSTREAM_DIGEST_AMD64}
ARG IMAGE_STATS
ENV IMAGE_STATS=${IMAGE_STATS} WEBUI_PORTS="6080/tcp,6080/udp" VNC_SERVER="host.docker.internal" VNC_PORT="5900"

RUN apk add --no-cache websockify

ARG VERSION
RUN curl -fsSL "https://github.com/novnc/noVNC/archive/refs/tags/v${VERSION}.tar.gz" | tar xzf - -C "${APP_DIR}" --strip-components=1

COPY root/ /
