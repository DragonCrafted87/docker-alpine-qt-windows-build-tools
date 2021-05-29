FROM dragoncrafted87/alpine:latest as wclang-builder

COPY root/. /

RUN apk add --update \
    build-base \
    clang \
    mingw-w64-gcc \
    cmake \
    git \
    && \
    git clone https://github.com/tpoechtrager/wclang.git \
    && \
    cd wclang \
    && \
    cmake -DCMAKE_INSTALL_PREFIX=_prefix_ . \
    && \
    make \
    && \
    make install

FROM dragoncrafted87/alpine:latest

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="DragonCrafted87 Qt Windows Cross-Compile Tools" \
      org.label-schema.description="Qt Windows Cross-Compile Tools." \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/DragonCrafted87/docker-alpine-qt-windows-build-tools" \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0"

COPY root/. /
COPY --from=wclang-builder /root/wclang/_prefix_/bin/* /usr/bin/

RUN apk add --update \
    build-base \
    clang \
    mingw-w64-gcc \
    cmake \
    bash \
    && \
    rm  -rf /tmp/* /var/cache/apk/* \
    && \
    chmod +x -R /scripts/*
