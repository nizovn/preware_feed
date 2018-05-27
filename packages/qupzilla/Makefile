NAME     = qupzilla
TITLE	 = QupZilla Web Browser
APP_ID   = com.nizovn.${NAME}
VERSION  = 2.2.6-0
TYPE	 = Application
CATEGORY = News And Internet
HOMEPAGE = https://github.com/nizovn/qupzilla
MAINTAINER = nizovn <nizovn@gmail.com>
ICON	 = https://raw.githubusercontent.com/nizovn/qupzilla/webos-v2.2.6/linux/hicolor/64x64/apps/qupzilla.png
MINWEBOSVERSION = 2.2.0
DESCRIPTION = QupZilla is a new and very fast QtWebEngine browser. It aims to be a lightweight web browser available through all major platforms. This project has been originally started only for educational purposes. But from its start, QupZilla has grown into a feature-rich browser.<br>\
QupZilla has all standard functions you expect from a web browser. It includes bookmarks, history (both also in sidebar) and tabs. Above that, it has by default enabled blocking ads with a built-in AdBlock plugin.<br>
CHANGELOG = \
2.2.6-0: Upstream upgrade<br> \
2.1.2-2: Split into separate packages, first Preware release, added support for context menus on long tap, added close button to window frames<br> \
2.1.2-1: Experimental phone support, enabled support for plugins/proprietary-codecs<br> \
2.1.2-0: Initial version

SCREENSHOTS = [\
\"https://raw.githubusercontent.com/nizovn/qupzilla/webos-v2.2.6/webOS/screenshots/qupzilla_2018-27-05_133959.png\"\
]
LICENSE  = GPL v3 Open Source
DEPENDS  = com.nizovn.qt5
DEVICECOMPATIBILITY = [\"TouchPad\"]

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk
include ../../support/package.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

SRC_DIR = build/src
QUPZILLA_DIR = /home/nizovn/webos/qt5/qt5.9/qupzilla

build/.unpacked-${VERSION}:
	rm -rf build
	mkdir -p ${SRC_DIR}
	mkdir ${SRC_DIR}/bin

	cp ${QUPZILLA_DIR}/webOS/appinfo.json ${SRC_DIR}
	cp ${QUPZILLA_DIR}/webOS/launch.sh ${SRC_DIR}
	cp ${QUPZILLA_DIR}/webOS/jail.conf ${SRC_DIR}
	cp ${QUPZILLA_DIR}/webOS/pmPostInstall.script ${SRC_DIR}
	cp ${QUPZILLA_DIR}/webOS/pmPreRemove.script ${SRC_DIR}
	cp ${QUPZILLA_DIR}/webOS/package.properties ${SRC_DIR}

	cp ${QUPZILLA_DIR}/bin/qupzilla ${SRC_DIR}/bin
	cp ${QUPZILLA_DIR}/bin/libQupZilla.so.2 ${SRC_DIR}/bin
	cp -r ${QUPZILLA_DIR}/bin/locale ${SRC_DIR}/bin
	cp -r ${QUPZILLA_DIR}/bin/plugins ${SRC_DIR}/bin
	cp -r ${QUPZILLA_DIR}/bin/themes ${SRC_DIR}/bin

	cp ${QUPZILLA_DIR}/linux/hicolor/64x64/apps/qupzilla.png ${SRC_DIR}
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

build/%/CONTROL/prerm:
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/pmPreRemove.script $@
	chmod ugo+x $@

build/%/CONTROL/postinst:
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/pmPostInstall.script $@
	chmod ugo+x $@

clobber::
	rm -rf build
