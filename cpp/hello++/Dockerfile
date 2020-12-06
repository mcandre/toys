FROM library/debian:buster
ENV PATH $PATH:/root/.local/bin:/root/sail/bin
COPY requirements-dev.txt /tmp
RUN apt-get update && \
    apt-get install -y \
        clang \
        cmake \
        cppcheck \
        doxygen \
        git \
        graphviz \
        make \
        python3-pip \
        python3-setuptools \
        valgrind \
        vera++ && \
    update-alternatives --set cc /usr/bin/clang && \
    update-alternatives --set c++ /usr/bin/clang++ && \
    cp -r /usr/lib/vera++ "$HOME/.vera++" && \
    ln -sf /src/vera "$HOME/.vera++/profiles/default" && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* \
        /var/cache/apt/pkgcache.bin \
        /var/cache/apt/srcpkgcache.bin && \
    pip3 install wheel && \
    pip3 install -r /tmp/requirements-dev.txt && \
    git clone https://github.com/mcandre/sail.git $HOME/sail
