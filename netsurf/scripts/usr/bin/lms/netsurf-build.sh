#!/bin/bash
# =========================================================================
# =========================================================================
#
#	netsurf-build.sh
#		Build the NetSurf binary and package in tarball.
#
#		A function based upon the original script provided by
#		NetSurf.org.  Very little re-writing was performed.
#
# =========================================================================
#
# @author Jay Wheeler.
# @version 0.1.0
# @copyright © 2018-2020. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package ldc-packagers/netsurf-build
# @subpackage Dockerfile
#
# =========================================================================
#
#	Copyright © 2018-2020. EarthWalk Software
#	Licensed under the GNU General Public License, GPL-3.0-or-later.
#
#   This file is part of ldc-packagers/netsurf-build.
#
#   ldc-packagers/netsurf-build is free software: you can redistribute 
#   it and/or modify it under the terms of the GNU General Public License 
#   as published by the Free Software Foundation, either version 3 of the 
#   License, or (at your option) any later version.
#
#   ldc-packagers/netsurf-build is distributed in the hope that it will 
#   be useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
#   of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with ldc-packagers/netsurf-build.  If not, see 
#   <http://www.gnu.org/licenses/>.
#
# =========================================================================
# =========================================================================
#
# NOTE: 
#
#    slightly modified version of the original script to fix 2 items:
#      - script could not run unattended (apt-get install paused waiting
#          for confirmation)
#      - script does not package the built result in a useable manner
#          - creates a tgz of the required files to install NetSurf
#              as a binary
#
# =========================================================================

declare nsUrl="${NSURF_SRC_URL}"
declare nsRepo="/pkg-repo"

declare nsArchName="netsurf-${NETSURF_VERS}-${NETSURF_BUILD}-deb-gtk-x86_64.tar.gz"
declare nsArchive="${nsRepo}/${nsArchName}"

declare nsEnv="./${NSURF_SRC_NAME}"

declare wsRoot="${HOME}"
declare wsPath="${wsRoot}/dev-netsurf/workspace"

# =========================================================================

. /usr/local/lib/lms/lmsConIn.lib
. /usr/local/lib/lms/lmsDeclare.lib
. /usr/local/lib/lms/lmsDisplay.lib
. /usr/local/lib/lms/lmsStr.lib

. /usr/local/lib/ldc/ldcBuildNS.lib

# =========================================================================
#
#
#
# =========================================================================

lmscli_optQuiet=${LMSOPT_QUIET}
lmscli_optDebug=${LMSOPT_DEBUG}
lmscli_optRemove=${LMSOPT_REMOVE}

lmsDisplay "###########################"
lmsDisplay "#"
lmsDisplay "#   Building NetSurf: ${nsArchive}"
lmsDisplay "#"
lmsDisplay "###########################"

lmsDisplay "calling nsLoadScript \"${nsUrl}\" \"${nsEnv}\""

nsLoadScript "${nsUrl}" "${nsEnv}"
[[ $? -eq 0 ]] ||
 {
 	lmscli_optQuiet=0
 	lmsDisplay "ERROR: nsLoadScript failed: nsUrl = \"${nsUrl}\", nsEnv = \"${nsEnv}\""
 	exit 1
 }

lmsDisplay "calling nsBuildApp \"${nsEnv}\" \"${wsPath}\""

nsBuildApp "${nsEnv}" "${wsPath}"
[[ $? -eq 0 ]] ||
 {
 	lmscli_optQuiet=0
 	lmsDisplay "ERROR: nsBuildApp failed: nsEnv = \"${nsEnv}\", ws_Path = \"${wsPath}\""
 	exit 2
 }

lmsDisplay "packaging"

mkdir -p usr/bin
mkdir -p usr/share/netsurf

cp ./nsgtk usr/bin
cp -r ./resources/* usr/share/netsurf

tar -cvf ${nsArchive} usr
rm -R usr

cd ~

[[ ${lmscli_optRemove} -ne 0 ]] &&
 {
    rm -Rf ./dev-netsurf
    rm ./env.* 2>/dev/null
 }

lmsDisplay "###########################"
lmsDisplay "#"
lmsDisplay "#   \"${nsArchive}\" successfully created."
lmsDisplay "#"
lmsDisplay "###########################"

exit 0
