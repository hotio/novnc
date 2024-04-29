ARG UPSTREAM_IMAGE
ARG UPSTREAM_DIGEST_ARM64

FROM ${UPSTREAM_IMAGE}@${UPSTREAM_DIGEST_ARM64}
EXPOSE 6081
ARG IMAGE_STATS
ENV IMAGE_STATS=${IMAGE_STATS} WEBUI_PORTS="6081/tcp,6081/udp"

RUN apk add --no-cache nginx

ARG VERSION
RUN curl -fsSL "https://github.com/novnc/noVNC/archive/refs/tags/v${VERSION}.tar.gz" | tar xzf - -C "${APP_DIR}" --strip-components=1

COPY root/ /
