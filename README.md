# ambari_build_tools
create development environment and build rpms for apache ambari

# pre-requirement
a centos7 instance(with python2.7) or docker

# usage
+ step 1: git clone https://www.github.com/alextinng/ambari_build_tools.git
+ step 2: cd ambari_build_tools
+ step 3: using shell to run command: sh /root/ambari_build/build.sh $ambari_version or docker run -it -v ./:/root/ambari_build centos:centos7 sh /root/ambari_build/build.sh $ambari_version(if don't have a centos7 instance)
