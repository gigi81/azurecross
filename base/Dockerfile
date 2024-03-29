FROM ubuntu:22.04
MAINTAINER Luigi Grilli "luigi.grilli@gmail.com"

# To make it easier for build and release pipelines to run apt-get,
# configure apt to not require confirmation (assume the -y argument by default)
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

RUN apt update \
&& apt install --no-install-recommends --yes \
automake \
autogen \
bash \
build-essential \
bc \
bzip2 \
ca-certificates \
cmake \
curl \
dirmngr \
file \
gettext \
gzip \
gnupg \
zip \
make \
ncurses-dev \
pkg-config \
libtool \
python3 \
python3-dev \
python3-pip \
rsync \
sed \
ssh \
bison \
flex \
tar \
pax \
vim \
wget \
xz-utils \
zlib1g-dev \
texinfo \
help2man \
gawk \ 
gperf \
libncurses5-dev \ 
jq \
git \
iputils-ping \
libfdt-dev \
libglib2.0-dev \
libpixman-1-dev \
zlib1g-dev \
&& apt-get clean --yes

WORKDIR /azp

COPY \
start.sh \
qemu.sh \
toolchain.sh \
toolchain.cmake \
/azp/

ENV QEMU_EXECVE 1

RUN chmod +x start.sh toolchain.sh qemu.sh && \
./qemu.sh
