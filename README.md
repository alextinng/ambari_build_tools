# ambari_build_tools
create development environment and build rpms for apache ambari

# pre-requirement
docker is necessary for build ambari.

# usage
+ step 1: git clone https://www.github.com/alextinng/ambari_build_tools.git
+ step 2: cd ambari_build_tools
+ step 3: docker run -it -v ./:/root/ambari_build centos:centos7 sh /root/ambari_build/build.sh $ambari_version
