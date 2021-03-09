yum groupinstall "Development Tools" unrar libnsl
unrar e GCC-930.rar
tar -xvf gmp-6.2.0.tar.xz
cd gmp-6.2.0/ && ./configure --prefix=/usr/local/gmp-6.2.0 && make && make install
cd ../ && tar -xvf mpfr-4.1.0.tar.xz &&cd mpfr-4.1.0/ && ./configure --prefix=/usr/local/mpfr-4.1.0 --with-gmp=/usr/local/gmp-6.2.0
make && make install
cd ../ && tar -xvf mpc-1.1.0.tar.gz && cd mpc-1.1.0/ 
./configure --prefix=/usr/local/mpc-1.1.0 --with-gmp=/usr/local/gmp-6.2.0 --with-mpfr=/usr/local/mpfr-4.1.0
make && make install
nano /etc/profile
export PATH=$PATH/opt/pttp/gcc-930
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH/usr/local/gmp6.2.0/lib:/usr/local/mpfr-4.1.0/lib:/usr/local/mpc-1.1.0/lib
source /etc/profile
nano  /etc/ld.so.conf
/usr/local/gmp-6.2.0/lib
/usr/local/mpfr-4.1.0/lib
/usr/local/mpc-1.1.0/lib
ldconfig
cd ../ &&  tar -xvf  gcc-9.3.0.tar.xz && cd gcc-9.3.0/
./configure --prefix=/opt/pttp/gcc930 --enable-threads=posix --disable-checking --disable-multilib --enable-languages=c,c++,fortran,lto --with-gmp=/usr/local/gmp-6.2.0 --with-mpfr=/usr/local/mpfr-4.1.0 --with-mpc=/usr/local/mpc-1.1.0
make -j 96 && make install
export
ln -sf /opt/pttp/gcc930/bin/gcc /usr/bin/gcc
ln -sf /opt/pttp/gcc930/bin/g++ /usr/bin/g++
ln -sf /opt/pttp/gcc930/bin/gfortran /usr/bin/lio
cd ../ && tar -xvf cpu2006_v101_1.4.1.tar.gz &&cd speccpu/
nano spec2006/prerun
export PATH=/opt/pttp/gcc930/bin:$PATH
exportLD_LIBRARY_PATH=/opt/pttp/gcc930/lib64/:/opt/pttp/gcc930/lib/:$LD_LIBRARY_PTAH
export LIBRARY_PATH=/opt/pttp/gcc930/lib64/:/opt/pttp/gcc930/:$ LIBRARY_PTAH
export CPATH=/opt/pttp/gcc930/include:$CPATH
echo $PATH
cp -ra ../ft2500-gcc930.cfg /home/phytium/speccpu/spec2006/config/
nano /home/phytium/speccpu/spec2006/run_test.sh