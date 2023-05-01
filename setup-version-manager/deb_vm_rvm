#!/bin/sh
prerequisite() {
    gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    command curl -sSL https://rvm.io/mpapis.asc | gpg --import -
    command curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -
}

install() {
    \curl -sSL https://get.rvm.io | bash -s stable --ruby
}

prerequisite
install
