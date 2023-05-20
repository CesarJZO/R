# Install dependencies

yum install gcc-gfortran gcc-c++ readline-devel libX11-devel libpng-devel libjpeg-devel libtiff-devel
yum install libX11-devel libXt-devel
yum install libcurl-devel


# Download

wget https://cran.r-project.org/src/base/R-4/R-4.3.0.tar.gz

tar zxvf R-4.3.0.tar.gz

# Install

cd R-4.3.0
./configure --prefix=/usr/local/ --enable-R-shlib --with-blas --with-pcre1

make
make install

# Verify
sudo ln -sf /usr/local/bin/R /usr/bin/R
