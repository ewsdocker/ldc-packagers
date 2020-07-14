# =========================================================================
# =========================================================================
#
#	Dockerfile
#	  Dockerfile for ldc-packagers:netsurf.
#
# =========================================================================
#
# @author Jay Wheeler.
# @version 0.1.0-b2
# @copyright © 2018-2020. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package ldc-packagers
# @subpackage Dockerfile
#
# =========================================================================
#
#	Copyright © 2018-2020. EarthWalk Software
#	Licensed under the GNU General Public License, GPL-3.0-or-later.
#
#   This file is part of ewsdocker/ldc-packagers.
#
#   ewsdocker/ldc-packagers is free software: you can redistribute 
#   it and/or modify it under the terms of the GNU General Public License 
#   as published by the Free Software Foundation, either version 3 of the 
#   License, or (at your option) any later version.
#
#   ewsdocker/ldc-packagers is distributed in the hope that it will 
#   be useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
#   of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with ewsdocker/ldc-packagers.  If not, see 
#   <http://www.gnu.org/licenses/>.
#
# =========================================================================
# =========================================================================

ARG FROM_REPO="ewsdocker"
ARG FROM_PARENT="ldc-base"
ARG FROM_VERS="dbase"
ARG FROM_EXT="-0.1.0"
ARG FROM_EXT_MOD="-b2"

FROM ${FROM_REPO}/${FROM_PARENT}:${FROM_VERS}${FROM_EXT}${FROM_EXT_MOD}

# ========================================================================================
# ========================================================================================

ARG FROM_REPO
ARG FROM_PARENT
ARG FROM_VERS
ARG FROM_EXT
ARG FROM_EXT_MOD

# ========================================================================================

ARG DNAME
ARG RUN_APP

# ========================================================================================

ARG LIB_HOST
ARG LIB_NAME
ARG LIB_VERSION
ARG LIB_VERS_MOD
ARG LIB_INSTALL

# ========================================================================================

ARG BUILD_CATEGORIES
ARG BUILD_DESKTOP
ARG BUILD_ICON

# =====================================================================================

ARG BUILD_REGISTRY
ARG BUILD_REPO

# =====================================================================================

ARG BUILD_NAME 
ARG BUILD_VERSION
ARG BUILD_VERS_EXT
ARG BUILD_EXT_MOD

# =====================================================================================

ARG BUILD_TEMPLATE
ARG BUILD_DAEMON

# ========================================================================================

ARG OPT_DEBUG
ARG OPT_TIMEOUT
ARG OPT_QUIET

# =========================================================================

ARG NETSURF_NAME
ARG NETSURF_GENERIC
ARG NETSURF_RELEASE
ARG NETSURF_VER
ARG NETSURF_HOST
ARG NETSURF_DIR

# =========================================================================
# =========================================================================

ENV DSTACK=${DNAME:-"UNKNOWN"}

# ========================================================================================

ENV NSURF_SRC_HOST=${NETSURF_SRC_HOST:-"https://git.netsurf-browser.org/netsurf.git/plain/docs/"} \
    NSURF_SRC_NAME=${NETSURF_SRC_NAME:-"env.sh"}

ENV NSURF_SRC_URL="${NSURF_SRC_HOST}/${NSURF_SRC_NAME}"

ENV NSURF_NAME=${NETSURF_NAME:-"NetSurf"} \
    NSURF_GENERIC=${NETSURF_GENERIC:-"netsurf"} \
    NSURF_RELEASE=${NETSURF_RELEASE:-"3.8"} \
    NSURF_VERS=${NETSURF_VERS:-"deb-gtk"} \
    NSURF_DIR=${NETSURF_DIR:-"./netsurf"}

ENV NSURF_BUILDER="0.1.0-b2" \
    NSURF_BUILD=2

ENV NSURF_HOST=${NETSURF_HOST:-"https://github.com/ewsdocker/debian-netsurf-packager/releases/download/${NSURF_BUILDER}"} \
    NSURF_PKG="${NSURF_GENERIC}-${NSURF_RELEASE}-${NSURF_BUILD}-${NSURF_VERS}-x86_64.tar.gz" 
    
ENV NSURF_URL="${NSURF_HOST}/${NSURF_PKG}"

# ========================================================================================
# ========================================================================================

ENV \
    LMS_DAEMON=${BUILD_DAEMON:-"1"} \
    LMS_TEMPLATE=${BUILD_TEMPLATE:-"daemon"} \
    \
    LMSOPT_TIMEOUT=${OPT_TIMEOUT:-"30"} \
    LMSOPT_QUIET=${OPT_QUIET:-"1"} \
    LMSOPT_DEBUG=${OPT_DEBUG:-"0"} \
    \
    LMS_BASE="/usr/local" \
    LMS_HOME= \
    LMS_CONF= \
    \
    LMS_REGISTRY=${BUILD_REGISTRY:-""} \
    LMS_REPO=${BUILD_REPO:-"ewsdocker"} \
    \
    LMS_CATEGORIES=${BUILD_CATEGORIES:-"Development"} \
    LMS_DESKTOP=${BUILD_DESKTOP:-"netsurf-packager"} \
    LMS_ICON=${BUILD_ICON:-"default.png"} \
    \
    LMS_FROM="${FROM_PARENT}:${FROM_VERS}${FROM_EXT}${FROM_EXT_MOD}" \
    LMS_PARENT="${FROM_PARENT}:${FROM_VERS}${FROM_EXT}${FROM_EXT_MOD}" \
    \
    LMS_NAME=${BUILD_NAME:-"ldc-packagers"} \
    LMS_VERSION=${BUILD_VERSION:-"netsurf"} \
    LMS_VERS_X=${BUILD_VERS_EXT:-"-0.1.0"} \
    LMS_VERS_MOD=${BUILD_EXT_MOD:-"-b2"} 

ENV LMS_VERS_EXT="${LMS_VERS_X}${LMS_VERS_MOD}" 

ENV LMS_RUN_NAME="${LMS_NAME}-${LMS_VERSION}${LMS_VERS_EXT}" \
    LMS_DOCKER_NAME="${LMS_NAME}:${LMS_VERSION}${LMS_VERS_EXT}"

ENV LMS_DOCKER="${LMS_REPO}/${LMS_DOCKER_NAME}" \
    LMS_PACKAGE="${LMS_PARENT}, ${LMS_DOCKER_NAME}"

# ========================================================================================
# ========================================================================================
#
#	ldc-library
#
# https://github.com/ewsdocker/ldc-utilities/releases/download/ldc-utilities-0.1.6/ldc-library-0.1.6-b2.tar.gz
#
# ========================================================================================
# ========================================================================================

ENV LMSLIB_INST=${LIB_INSTALL:-"0"} \
    LMSLIB_NAME=${LIB_NAME:-"ldc-library"} \
    LMSLIB_VERS=${LIB_VERSION:-"0.1.6"} \
    LMSLIB_VERS_MOD=${LIB_VERS_MOD:-"-b2"}

ENV LMSLIB_HOST=${LIB_HOST:-"https://github.com/ewsdocker/ldc-utilities/releases/download/ldc-utilities-${LMSLIB_VERS}"}

ENV LMSLIB_VERSION="${LMSLIB_VERS}${LMSLIB_VERS_MOD}"
ENV LMSLIB_FULLNAME="${LMSLIB_NAME}-${LMSLIB_VERSION}"

ENV LMSLIB_PKG=${LMSLIB_FULLNAME}.tar.gz 

ENV LMSLIB_URL=${LMSLIB_HOST}/${LMSLIB_PKG}

# ========================================================================================
# ========================================================================================

VOLUME /conf
VOLUME /usrlocal

# ========================================================================================
# ========================================================================================

COPY scripts/. /

# =========================================================================
# =========================================================================

RUN apt-get -y update \
 && apt-get -y upgrade \
 && apt-get -y install \
               gstreamer0.10-qapt \
               gstreamer1.0-gtk3 \
               gtk3-engines-xfce \
               libhpdf-dev \
               libjpeg-dev \
               libmozjs-60-dev \
               libpng-dev \
               librsvg2-dev \
               libwebp-dev \
 && apt-get clean all \
 && chmod -R +x /usr/local/bin/* \
 && chmod +x /usr/bin/lms/netsurf-build.sh \
 && ln -s /usr/bin/lms/netsurf-build.sh /usr/bin/lms-buildns \
 && printf "${LMSBUILD_DOCKER} (${LMSBUILD_PACKAGE}), %s @ %s\n" `date '+%Y-%m-%d'` `date '+%H:%M:%S'` >> /etc/ewsdocker-builds.txt 

# =========================================================================

ENTRYPOINT ["/my_init","--quiet"]
CMD ["lms-buildns"]
