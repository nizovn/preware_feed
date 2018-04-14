NAME     = qt5
TITLE	 = Qt5 framework libraries
APP_ID   = com.nizovn.${NAME}
VERSION  = 5.9.1-0
TYPE	 = Library
CATEGORY = System Utilities
HOMEPAGE = https://www.qt.io/
MAINTAINER = nizovn <nizovn@gmail.com>
ICON	 = https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Qt_logo_2016.svg/320px-Qt_logo_2016.svg.png
MINWEBOSVERSION = 2.2.0
DESCRIPTION = Cross-platform application development framework.<br>
CHANGELOG = \
5.9.1-0: First public release
LICENSE  = LGPL v3 Open Source
DEPENDS  = com.nizovn.glibc, com.nizovn.qt5qpaplugins, com.nizovn.openssl, com.nizovn.cacert, org.webosinternals.dbus

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk
include ../../support/package.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

SRC_DIR = build/src
QT5_WEBOS_DIR = /home/nizovn/webos/qt5/qt5.9/runtime

build/.unpacked-${VERSION}:
	rm -rf build
	mkdir -p ${SRC_DIR}
	mkdir ${SRC_DIR}/lib

	cp ${QT5_WEBOS_DIR}/lib/*.so.5  ${SRC_DIR}/lib
	cp -r ${QT5_WEBOS_DIR}/plugins ${SRC_DIR}
	rm ${SRC_DIR}/plugins/platforms/libqwebos.so

	cp -r ${QT5_WEBOS_DIR}/qml ${SRC_DIR}
	cp -r ${QT5_WEBOS_DIR}/libexec ${SRC_DIR}
	cp -r ${QT5_WEBOS_DIR}/resources ${SRC_DIR}
	cp -r ${QT5_WEBOS_DIR}/translations ${SRC_DIR}

	cp -RfL qt.conf ${SRC_DIR}/libexec
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
