#!/bin/bash

repoRoot=$(pwd)

get() {
   sudo apt-get install -y \
		autoconf \
		automake \
		cmake \
		g++ \
		git \
		libssl-dev \
		libtool \
		make \
		pkg-config \
		python3 \
		python3-jinja2

	# Boost packages (also required)
	sudo apt-get install -y \
		libboost-chrono-dev \
		libboost-context-dev \
		libboost-coroutine-dev \
		libboost-date-time-dev \
		libboost-filesystem-dev \
		libboost-iostreams-dev \
		libboost-locale-dev \
		libboost-program-options-dev \
		libboost-serialization-dev \
		libboost-signals-dev \
		libboost-system-dev \
		libboost-test-dev \
		libboost-thread-dev

	# Optional packages (not required, but will make a nicer experience)
	sudo apt-get install -y \
		doxygen \
		libncurses5-dev \
		libreadline-dev \
		perl 
    git clone https://github.com/steemit/steem
    cd steem
    git submodule update --init --recursive
}

build () {
    chmod +x scripts/build_steem.sh
    ./scripts/build_steem.sh
}

if [ $# -eq 0 ]; then
    get
    build
fi

$@
