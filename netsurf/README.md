## ewsdocker/ldc-packagers:netsurf-0.1.0-b2  
**A NetSurf Internet browser packager for Debian in a Docker image.**  

**Pre-built Docker images are available from [ewsdocker/ldc-packagers:netsurf-0.1.0](https://hub.docker.com/r/ewsdocker/ldc-packagers:netsurf-0.1.0).**  

____  
#### Overview  
**ewsdocker/ldc-packagers:netsurf-0.1.0** implements the build script for the 
[NetSurf](http://www.netsurf-browser.org/) browser for Linux, with the GTK 
[NetSurf](http://www.netsurf-browser.org/) front-end, to create a Docker-based [NetSurf](http://www.netsurf-browser.org/) browser.  

The NetSurf browser <b>must</b> be compiled from original source in order to use it.  This provides a challenge for many whose only desire is to experiment with the browser, not learn how to build it. Creating an installation package for a given OS release can be very time consuming, especially if the product must be supported over a range of releases. is compiled for use on a Debian-based (v 10.4+) operating system by:  
1. Downloading the provided b
The compiled application binary and support libraries are packaged in a tar-ed, gzip-ed archive, which is used to create a Debian-based installation package (<b>.deb</b>) file. 

The **ewsdocker/ldc-packagers:netsurf-0.1.0** downloads the latest build script for the Open Source [NetSurf](http://www.netsurf-browser.org/) browser for <b>Debian</b> platform, compiles and builds the latest NetSurf browser and packages the resultant binary and required libraries into a tarball, which is then converted to a Debian package for installation in a Debian 9 operating system or container os.  

____  
#### NOTE  
**ewsdocker/ldc-packagers:netsurf-0.1.0** is designed to be used on a Linux system configured to support **Docker user namespaces** .  Refer to [ewsdocker Containers and Docker User Namespaces](https://github.com/ewsdocker/ewsdocker.github.io/wiki/UserNS-Overview) for an overview and information on running **ewsdocker/ldc-packagers:netsurf-0.1.0** on a system not configured for **Docker user namespaces**.
____  

**Visit the [ewsdocker/ldc-packagers:netsurf-0.1.0 Wiki](https://github.com/ewsdocker/ldc-packagers:netsurf-0.1.0/wiki/QuickStart) for complete documentation of this docker image.**  
____  

#### Installing ewsdocker/ldc-packagers:netsurf-0.1.0  

The following scripts will download the selected **ewsdocker/ldc-packagers:netsurf-0.1.0** image, create a container, setup and populate the directory structures and create the run-time scripts.  

The _default_ values will install all directories and contents in the **docker host** user's home directory (refer to [Mapping docker host resources to the docker container](https://github.com/ewsdocker/ldc-packagers:netsurf-0.1.0/wiki/QuickStart#mapping)),  

____  
**ewsdocker/ldc-packagers:netsurf-0.1.0-b2**  
  
    docker run --rm \
               -v ${HOME}/bin:/userbin \
               -v ${HOME}/.local:/usrlocal \
               -e LMS_BASE="${HOME}/.local" \
               -v ${HOME}/.config/docker:/conf \
               -v ${HOME}/.config/docker/ldc-packagers:netsurf-0.1.0-b2/root \
               --name=ldc-packagers:netsurf-0.1.0-b2 \
           ewsdocker/ldc-packagers:netsurf-0.1.0:b2 lms-setup  

____  
Refer to [Mapping docker host resources to the docker container](https://github.com/ewsdocker/ldc-packagers:netsurf-0.1.0/wiki/QuickStart#mapping) for a discussion of **lms-setup** and what it does.  

____  
#### Running the installed scripts  

After running the above command script, and using the settings indicated, the docker host directories, mapped as shown in the above tables, will be configured as follows:

+ the executable scripts have been copied to **~/bin**;  
+ the associated **ldc-packagers:netsurf-"version"** execution script(s) (shown below) will be found in **~/.local/bin**, and _should_ be customized with proper local volume names.  

____  
**ewsdocker/ldc-packagers:netsurf-0.1.0-b2**
  
    docker run -it \
               --rm \
               -v /etc/localtime:/etc/localtime:ro \
               -v ${HOME}/pkg-repo:/pkg-repo \
               -v ${HOME}/workspace-ldc-packagers:netsurf-0.1.0-b2:/workspace \
               -v ${HOME}/.config/docker/ldc-packagers:netsurf-0.1.0-b2:/root \
               -e LMSOPT_QUIET=0 \
               -e LMSOPT_DEBUG=0 \
               -e LMSOPT_REMOTE=1 \
               --name=ldc-packagers:netsurf-0.1.0-b2 \
           ewsdocker/ldc-packagers:netsurf-0.1.0-b2  

____  
Refer to [Mapping docker host resources to the docker container](https://github.com/ewsdocker/ldc-packagers:netsurf-0.1.0/wiki/QuickStart#mapping) for a discussion of customizing the executable scripts..  

____  
#### Persistence  
In order to persist the **ldc-packagers:netsurf-0.1.0** application state, a location on the docker _host_ must be provided to store the necessary information.  This can be accomplished with the following volume option in the run command:

    -v ${HOME}/.config/docker/ldc-packagers:netsurf-"version":/root  

Since the information is stored in the docker _container_ **/root** directory, this statement maps the user's **~/.config/docker/ldc-packagers:netsurf-"version"** docker _host_ directory to the **/root** directory in the docker _container_.  

____  
#### Timestamps  
It is important to keep the time and date on docker _host_ files that have been created and/or modified by the docker _containter_ synchronized with the docker _host_'s settings. This can be accomplished as follows:

    -v /etc/localtime:/etc/localtime:ro  

____  
**Copyright © 2018-2020. EarthWalk Software.**  
**Licensed under the GNU General Public License, GPL-3.0-or-later.**  

This file is part of **ewsdocker/ldc-packagers:netsurf**.  

**ewsdocker/ldc-packagers:netsurf** is free software: you can redistribute 
it and/or modify it under the terms of the GNU General Public License 
as published by the Free Software Foundation, either version 3 of the 
License, or (at your option) any later version.  

**ewsdocker/ldc-packagers:netsurf** is distributed in the hope that it will 
be useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.  

You should have received a copy of the GNU General Public License
along with **ewsdocker/ldc-packagers:netsurf**.  If not, see 
<http://www.gnu.org/licenses/>.  

