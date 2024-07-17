apt-get update
apt-get -y install locales
export DEBIAN_FRONTEND=noninteractive


READLINE_VERSION=8
if [ "${UBUNTU_CODENAME}" == "bionic" ]; then
    READLINE_VERSION=7
fi

apt-get install -y --no-install-recommends \
    libglpk40 \
    bash-completion \
    ca-certificates \
    file \
    fonts-texgyre \
    g++ \
    gfortran \
    gsfonts \
    libblas-dev \
    libbz2-* \
    libcurl4 \
    "libicu[0-9][0-9]" \
    liblapack-dev \
    libpcre2* \
    libjpeg-turbo* \
    libpangocairo-* \
    libpng16* \
    "libreadline${READLINE_VERSION}" \
    libtiff* \
    liblzma* \
    libxt6 \
    make \
    tzdata \
    unzip \
    zip \
    zlib1g

BUILDDEPS="curl \
    libhdf5-dev \
    libgsl-dev \
    default-jdk \
    devscripts \
    libbz2-dev \
    libcairo2-dev \
    libcurl4-openssl-dev \
    libpango1.0-dev \
    libjpeg-dev \
    libicu-dev \
    libpcre2-dev \
    libpng-dev \
    libreadline-dev \
    libtiff5-dev \
    liblzma-dev \
    libx11-dev \
    libxt-dev \
    perl \
    rsync \
    subversion \
    tcl-dev \
    tk-dev \
    texinfo \
    texlive-extra-utils \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-latex-recommended \
    texlive-latex-extra \
    x11proto-core-dev \
    xauth \
    xfonts-base \
    xvfb \
    wget \
    zlib1g-dev"

apt-get install -y --no-install-recommends ${BUILDDEPS}


apt-get autoremove -y
apt-get autoclean -y
rm -rf /var/lib/apt/lists/*
