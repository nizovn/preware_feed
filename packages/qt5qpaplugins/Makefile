NAME     = qt5qpaplugins
TITLE	 = webOS Qt5 QPA Plugins
APP_ID   = com.nizovn.${NAME}
VERSION  = 1.0.0
TYPE	 = Library
CATEGORY = System Utilities
HOMEPAGE = https://github.com/nizovn/qt5-qpa-webos-plugin
MAINTAINER = nizovn <nizovn@gmail.com>
ICON	 = https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Qt_logo_2016.svg/320px-Qt_logo_2016.svg.png
MINWEBOSVERSION = 2.2.0
CHANGELOG = \
1.0.0: First public release
LICENSE  = LGPL v3 Open Source
DEPENDS  = com.nizovn.glibc

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk
include ../../support/package.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

SRC_DIR = build/src
QT5_WEBOS_DIR = /home/nizovn/webos/qt5/qt5.9/runtime

build/.unpacked-${VERSION}:
	rm -rf build
	mkdir -p ${SRC_DIR}/plugins/platforms
	cp ${QT5_WEBOS_DIR}/plugins/platforms/libqwebos.so ${SRC_DIR}/plugins/platforms/
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/armv7.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -f $@
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	touch $@

clobber::
	rm -rf build
