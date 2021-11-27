# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := expat
$(PKG)_WEBSITE  := https://github.com/libexpat/libexpat
$(PKG)_DESCR    := Expat XML Parser
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.3.0
$(PKG)_GH_REL   := R_$(subst .,_,$($(PKG)_VERSION))
$(PKG)_CHECKSUM := 89df123c62f2c2e2b235692d9fe76def6a9ab03dbe95835345bf412726eb1987
$(PKG)_GH_CONF  := libexpat/libexpat/releases
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_URL      := https://github.com/libexpat/libexpat/releases/download/$($(PKG)_GH_REL)/$($(PKG)_SUBDIR).tar.gz
$(PKG)_DEPS     := cc

define $(PKG)_BUILD
    cd '$(BUILD_DIR)' && $(SOURCE_DIR)/configure \
        $(MXE_CONFIGURE_OPTS) \
        --without-docbook
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)'
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install
endef
