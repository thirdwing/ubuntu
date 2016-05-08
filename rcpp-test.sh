#!/bin/bash
add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu xenial/"
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
apt-get update -q
apt-get -y install r-base-dev
apt-get -y install git
add-apt-repository -y ppa:edd/misc
apt-get update -q
apt-get -y install r-cran-runit r-cran-inline r-cran-rbenchmark r-cran-highlight r-cran-pkgkitten
