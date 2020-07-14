#!/bin/bash
# ===========================================================================
#
#    ldc-packagers:netsurf-0.1.0-b2
#
# ===========================================================================
cd ~/Development/ewsldc/ldc-packagers/netsurf

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-packagers:netsurf container"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-packagers-netsurf-0.1.0-b2 2>null
docker rm ldc-packagers-netsurf-0.1.0-b2 2>null

echo "   ********************************************"
echo "   ****"
echo "   **** removing ldc-packagers:netsurf image"
echo "   ****"
echo "   ********************************************"
echo
docker rmi ewsdocker/ldc-packagers:netsurf-0.1.0-b2 

echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-packagers:netsurf-0.1.0-b2 image "
echo "   ****"
echo "   ***************************************************"
echo
docker build \
  --build-arg RUN_APP="netsurf" \
  \
  --build-arg DNAME="NETSURF" \
  \
  --build-arg NETSURF_SRC_HOST="http://alpine-nginx-pkgcache" \
  --build-arg NETSURF_SRC_NAME="env.sh" \
  \
  --build-arg NETSURF_NAME="NetSurf" \
  --build-arg NETSURF_GENERIC="netsurf" \
  --build-arg NETSURF_RELEASE="3.8" \
  --build-arg NETSURF_VER="deb-gtk" \
  --build-arg NETSURF_DIR="./netsurf" \
  \
  --build-arg NETSURF_HOST="http://alpine-nginx-pkgcache" \
  \
  --build-arg NETSURF_BUILD="2" \
  --build-arg NETSURF_BUILDER="0.1.0-b2" \
  \
  --build-arg BUILD_DAEMON="1" \
  --build-arg BUILD_TEMPLATE="daemon" \
  \
  --build-arg BUILD_NAME="ldc-packagers" \
  --build-arg BUILD_VERSION="netsurf" \
  --build-arg BUILD_VERS_EXT="-0.1.0" \
  --build-arg BUILD_EXT_MOD="-b2" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-stack-dev" \
  --build-arg FROM_VERS="dgtk3-dev" \
  --build-arg FROM_EXT="-0.1.0" \
  --build-arg FROM_EXT_MOD="-b2" \
  \
  --build-arg LIB_VERSION="0.1.6" \
  --build-arg LIB_VERS_MOD="-b2" \
  --build-arg LIB_INSTALL="0" \
  \
  --build-arg LIB_HOST=http://alpine-nginx-pkgcache \
  --network=pkgnet \
  \
  --file Dockerfile \
  -t ewsdocker/ldc-packagers:netsurf-0.1.0-b2  .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-packagers:netsurf-0.1.0-b2 failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-packagers-netsurf-0.1.0-b2 container"
echo "   ****"
echo "   ***********************************************"
echo

docker run \
  --rm \
  \
  -e LMS_BASE="${HOME}/.local" \
  -e LMS_HOME="${HOME}" \
  -e LMS_CONF="${HOME}/.config" \
  \
  -v /etc/localtime:/etc/localtime:ro \
  -v ${HOME}/pkgnetsurf:/pkgnetsurf \
  \
  -v ${HOME}/bin:/userbin \
  -v ${HOME}/.local:/usrlocal \
  -v ${HOME}/.config/docker:/conf \
  -v ${HOME}/.config/docker/ldc-packagers-netsurf-0.1.0:/root \
  -v ${HOME}/.config/docker/ldc-packagers-netsurf-0.1.0/workspace:/workspace \
  \
  --name=ldc-packagers-netsurf-0.1.0-b2 \
ewsdocker/ldc-packagers:netsurf-0.1.0-b2
[[ $? -eq 0 ]] ||
 {
 	echo "build container ldc-packagers-netsurf-0.1.0-b2 failed."
 	exit 1
 }

echo "   ********************************************"
echo "   ****"
echo "   **** removing container: ldc-packagers-netsurf-0.1.0-b2"
echo "   ****"
echo "   ********************************************"
echo

docker rm ldc-packagers-netsurf-0.1.0-b2
[[ $? -eq 0 ]] ||
 {
 	echo "rm ldc-packagers-netsurf-0.1.0-b2 failed."
 }

echo "   ********************************************"
echo "   ****"
echo "   **** ldc-packagers:netsurf successfully installed."
echo "   ****"
echo "   ********************************************"
echo

exit 0
