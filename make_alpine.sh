#!/bin/bash

cd alpine

# Precomp Gauche HEAD
rm -Rf work
mkdir -p work

(cd work; git clone git://github.com/shirok/Gauche.git)
(cd work/Gauche; ./DIST tgz)

tarball=$(basename work/*.tgz)

docker run --interactive --rm --volume=$(pwd)/work:/work --workdir=/work ubuntu sh <<EOS
apt-get update
apt-get build-dep -y gauche-dev
apt-get install -y libtool curl

# Alpine apk installs gdbm 1.11.
cd /tmp
curl -O ftp://ftp.gnu.org/gnu/gdbm/gdbm-1.11.tar.gz
tar xf gdbm-1.11.tar.gz
cd gdbm-1.11
./configure
make
make install

# Build Gauche
cd /tmp
tar xf /work/${tarball}
cd ${tarball%\.tgz}
make clean
./configure --with-local=/usr/local --with-dbm=gdbm
make
make check
make install
cd ..
cat <<EOF > gdbm_exclude
bin/gdbm*
lib/libgdbm*
share/man/**/gdbm*
share/info/gdbm*
share/locale/**/gdbm*
EOF
tar cf /work/Gauche-binary.tgz --exclude-from gdbm_exclude -C /usr/local bin lib share
EOS

mkdir -p work/usr/local
tar xf work/Gauche-binary.tgz -C work/usr/local
docker build -t nkoguro/alpine-gauche .
