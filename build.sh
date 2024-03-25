AMBARI_VERSION=$1

yum -y install java-1.8.0-openjdk-devel
yum -y install wget
yum -y install gcc gcc-c++ kernel-devel
yum -y install rpm-build

mkdir -p /root/ambari_build && cd /root/ambari_build

# download and setup maven
wget https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz --no-check-certificate
tar xvf apache-maven-3.9.6-bin.tar.gz
mv apache-maven-3.9.6 /usr/local
export PATH=/usr/local/apache-maven-3.9.6/bin:$PATH

# download and install python setuptools
wget https://files.pythonhosted.org/packages/25/5d/cc55d39ac39383dd6e04ae80501b9af3cc455be64740ad68a4e12ec81b00/setuptools-0.6c11-py2.7.egg#md5=fe1f997bc722265116870bc7919059ea --no-check-certificate
sh setuptools-0.6c11-py2.7.egg

# download and package ambari
export _JAVA_OPTIONS="-Xmx2048m -XX:MaxPermSize=512m -Djava.awt.headless=true"

wget https://dlcdn.apache.org/ambari/ambari-$AMBARI_VERSION/apache-ambari-$AMBARI_VERSION-src.tar.gz --no-check-certificate
tar xfvz apache-ambari-$AMBARI_VERSION-src.tar.gz
cd apache-ambari-$AMBARI_VERSION-src
mvn versions:set -DnewVersion=$AMBARI_VERSION.0.0

pushd ambari-metrics
mvn versions:set -DnewVersion=$AMBARI_VERSION.0.0
popd

mvn -B clean install rpm:rpm -DnewVersion=$AMBARI_VERSION.0.0 -DbuildNumber=da8f1b9b5a799bfa8e2d8aa9ab31d6d5a1cc31a0 -DskipTests -Dpython.ver="python >= 2.6"
