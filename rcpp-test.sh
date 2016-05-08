#!/bin/bash
add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu xenial/"
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
apt-get update -q
apt-get -y install r-base-dev
apt-get -y install git
Rscript -e "install.packages(c('RUnit','highlight','inline','rbenchmark','pkgKitten'), repo = 'https://cran.rstudio.com')"
cd 
mkdir .R
echo "CFLAGS +=             -Wall -pipe -pedantic -std=gnu99" >> .R/Makevars
echo "CXXFLAGS +=           -Wall -pipe -Wno-unused -pedantic" >> .R/Makevars
git clone https://github.com/RcppCore/Rcpp.git
R CMD build --no-build-vignettes --no-manual Rcpp
R CMD check --no-build-vignettes --no-manual --as-cran Rcpp_*
