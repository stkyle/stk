

yum install -y git 
yum install -y cmake3
yum install -y make

yum install -y leveldb-devel
yum install -y libmicrohttpd-devel
yum install -y gmp-devel
yum install -y python-pip
# There is a package for gcc-5.2.1, if that's close enough. First you need to enable the Software Collections, then it's available in devtoolset-4:
yum install -y centos-release-scl
yum install -y devtoolset-6-gcc*


scl enable devtoolset-6 bash

# http://mirror.math.princeton.edu/pub/eclipse//technology/epp/downloads/release/oxygen/R/eclipse-cpp-oxygen-R-linux-gtk-x86_64.tar.gz

# libGL is the main OpenGL library (i.e. Mesa). 
# libOSMesa is the OSMesa (Off-Screen) interface library.
yum-builddep mesa
# =====================================
# cpp-ethereum - Ethereum C++ client
# =====================================
git clone --recursive https://github.com/ethereum/cpp-ethereum.git
cd cpp-ethereum
# Note: The --recursive option is important. It orders git to clone additional submodules which are required to build the project. If you missed it you can correct your mistake with command git submodule update --init.

# =====================================
# ethminer - Ethereum Miner
# =====================================
git clone --recursive https://github.com/ethereum-mining/ethminer.git


