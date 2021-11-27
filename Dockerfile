#FROM dragoncrafted87/alpine:latest
#
#COPY root/. /
#
#RUN apk add --update \
#    bash \
#    hunspell-dev \
#    build-base \
#    clang \
#    clang-dev \
#    clang-static \
#    cups-dev \
#    dbus-dev \
#    double-conversion-dev \
#    eudev-dev \
#    fontconfig-dev \
#    freetype-dev \
#    git \
#    glib-dev \
#    gtk+3.0-dev \
#    harfbuzz-dev \
#    icu-dev \
#    libb2-dev \
#    libinput-dev \
#    libjpeg-turbo-dev \
#    libpng-dev \
#    libproxy-dev \
#    libxkbcommon-dev \
#    llvm11 \
#    llvm11-dev \
#    llvm11-static \
#    mariadb-dev \
#    mesa-dev \
#    mingw-w64-gcc \
#    openssl-dev \
#    pcre2-dev \
#    perl \
#    postgresql-dev \
#    samurai \
#    sqlite-dev \
#    tslib-dev \
#    unixodbc-dev \
#    vulkan-headers \
#    vulkan-loader-dev \
#    wayland-dev \
#    xcb-util-dev \
#    xcb-util-image-dev \
#    xcb-util-keysyms-dev \
#    xcb-util-renderutil-dev \
#    xcb-util-wm-dev \
#    xmlstarlet \
#    zlib-dev \
#    && \
#    apk add --no-cache --update cmake --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main \
#    && \
#    rm  -rf /tmp/* /var/cache/apk/* \
#    && \
#    chmod +x -R /scripts/* \
#    && \
#    git clone https://github.com/tpoechtrager/wclang.git \
#    && \
#    mkdir -p /root/wclang-build \
#    && \
#    cd /root/wclang-build \
#    && \
#    cmake  \
#        -S /root/wclang \
#        -GNinja \
#        -DCMAKE_INSTALL_PREFIX=/usr \
#        -DCMAKE_CXX_COMPILER=clang++ \
#        -DCMAKE_C_COMPILER=clang \
#    && \
#    cmake --build . --parallel \
#    && \
#    cmake --install . \
#    && \
#    cd /root \
#    && \
#    rm  -rf /root/wclang*
#
#
#
#RUN git clone git://code.qt.io/qt/qt5.git qt \
#    && \
#    cd /root/qt \
#    && \
#    git checkout v6.2.1 \
#    && \
#    perl init-repository \
#        --module-subset=essential,addon,-qtwebengine,-qtsensors,-qtserialbus,-qtserialport
#
#
#
#RUN mkdir -p /root/qt-build/linux \
#    && \
#    cd /root/qt-build/linux \
#    && \
#    cmake  \
#        -S /root/qt \
#        -GNinja \
#        -Wno-dev \
#        -DBUILD_SHARED_LIBS=OFF \
#        -DBUILD_WITH_PCH=OFF \
#        -DCMAKE_BUILD_TYPE=Release \
#        -DCMAKE_INSTALL_PREFIX=/usr/qt6/linux \
#        -DFEATURE_eventfd=OFF \
#        -DFEATURE_glib=OFF \
#        -DFEATURE_icu=OFF \
#        -DFEATURE_sql_db2=OFF \
#        -DFEATURE_sql_ibase=OFF \
#        -DFEATURE_sql_mysql=OFF \
#        -DFEATURE_sql_oci=OFF \
#        -DFEATURE_sql_odbc=OFF \
#        -DFEATURE_sql_psql=OFF \
#        -DFEATURE_sql_sqlite=OFF \
#        -DFEATURE_sql_sqlite=ON \
#        -DINPUT_opengl=no \
#        -DINPUT_openssl=no \
#        -DQT_BUILD_EXAMPLES=OFF \
#        -DQT_BUILD_TESTS=OFF \
#        -DQT_FEATURE_journald=OFF \
#        -DQT_FEATURE_vulkan=ON \
#        -DQT_QMAKE_TARGET_MKSPEC=linux-clang \
#    && \
#    cmake --build . --parallel \
#    && \
#    cmake --install .
#
## https://github.com/qt/qtbase/blob/dev/cmake/configure-cmake-mapping.md
#FROM qt_6_2_1_release_linux AS qt_6_2_1_debug_windows
#RUN mkdir -p /root/qt-build/windows/debug \
#    && \
#    cd /root/qt-build/windows/debug \
#    && \
#cmake  \
#    -S /root/qt \
#    -GNinja \
#    -Wno-dev \
#    -DBUILD_qtactiveqt=OFF \
#    -DBUILD_qtdoc=OFF \
#    -DBUILD_qttools=OFF \
#    -DBUILD_qttranslations=OFF \
#    -DBUILD_SHARED_LIBS=ON \
#    -DBUILD_WITH_PCH=OFF \
#    -DCMAKE_BUILD_TYPE=Debug \
#    -DCMAKE_CXX_COMPILER=x86_64-w64-mingw32-clang++ \
#    -DCMAKE_C_COMPILER=x86_64-w64-mingw32-clang \
#    -DCMAKE_INSTALL_PREFIX=/usr/qt6/windows/debug \
#    -DCMAKE_SYSTEM_NAME=Windows \
#    -DCMAKE_SYSTEM_VERSION=10 \
#    -DFEATURE_accessibility=ON \
#    -DFEATURE_dbus=OFF \
#    -DFEATURE_directfb=OFF \
#    -DFEATURE_fontconfig=OFF \
#    -DFEATURE_glib=ON \
#    -DFEATURE_icu=OFF \
#    -DFEATURE_libjpeg=ON \
#    -DFEATURE_libpng=ON \
#    -DFEATURE_opengl=ON \
#    -DFEATURE_opengl_dynamic=ON \
#    -DFEATURE_openssl=ON \
#    -DFEATURE_openssl_linked=ON \
#    -DFEATURE_pcre2=ON \
#    -DFEATURE_pkg_config=ON \
#    -DFEATURE_rpath=OFF \
#    -DFEATURE_sql=ON \
#    -DFEATURE_sql_mysql=ON \
#    -DFEATURE_sql_odbc=ON \
#    -DFEATURE_sql_pqsql=ON \
#    -DFEATURE_sql_sqlite=ON \
#    -DFEATURE_style_windows=ON \
#    -DFEATURE_style_windowsvista=ON \
#    -DFEATURE_use_gold_linker_alias=OFF \
#    -DHAVE_openssl=ON \
#    -DINPUT_freetype=system \
#    -DINPUT_harfbuzz=system \
#    -DINPUT_libjpeg=system \
#    -DINPUT_libpng=system \
#    -DINPUT_pcre=system \
#    -DINPUT_sqlite=system \
#    -DQT_BUILD_BENCHMARKS=OFF \
#    -DQT_BUILD_EXAMPLES=OFF \
#    -DQT_BUILD_EXAMPLES_BY_DEFAULT=OFF \
#    -DQT_BUILD_TESTS=OFF \
#    -DQT_BUILD_TOOLS_BY_DEFAULT=ON \
#    -DQT_BUILD_TOOLS_WHEN_CROSSCOMPILING=ON \
#    -DQT_FEATURE_journald=OFF \
#    -DQT_FEATURE_vulkan=ON \
#    -DQT_HOST_PATH=/usr/qt6/linux/debug \
#    -DQT_QMAKE_DEVICE_OPTIONS='CROSS_COMPILE=/usr/bin/x86_64-w64-mingw32' \
#    -DQT_QMAKE_TARGET_MKSPEC=win32-g++ \
#    -DQT_WILL_BUILD_TOOLS=ON \
#    && \
#    cmake --build . --parallel \
#    && \
#    cmake --install .




FROM dragoncrafted87/alpine:3.14

COPY root/. /

RUN apk add --update \
        autoconf  \
        automake  \
        bison  \
        build-base \
        bzip2  \
        cmake  \
        curl  \
        diffutils  \
        flex  \
        gcc \
        gcompat  \
        gdk-pixbuf-dev \
        gettext  \
        gettext-dev  \
        git  \
        gperf  \
        gtk-doc  \
        gzip  \
        intltool \
        libffi-dev  \
        libtool  \
        lzip  \
        make  \
        meson  \
        ninja  \
        openssl \
        openssl-dev  \
        orc \
        p7zip  \
        patch  \
        pkgconf  \
        ruby  \
        scons  \
        tar  \
        unzip \
        wget  \
        which  \
        xz  \
        zip  \
    && \
    rm  -rf /tmp/* /var/cache/apk/* \
    && \
    chmod +x -R /scripts/* \
    && \
    ln -s /usr/bin/python3 /usr/bin/python \
    && \
    cd /mxe \
    && \
    make

RUN git clone https://github.com/DragonCrafted87/bash-settings.git \
    && \
    ln -s /root/bash-settings/hw_bashrc.sh .bashrc \
    && \
    ln -s /root/bash-settings/bashrc.d/ .bashrc.d


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

