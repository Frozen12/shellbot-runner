FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir -p /src
WORKDIR /src
COPY . .

ENV RCLONE_CONFIG=/app/.config/rclone.conf
ENV RCLONE_DRIVE_TPSLIMIT=3

RUN chmod +x setup.sh && sh setup.sh

#install megatools
#install required packages to compile source
#install dependencies for megatools experimental 1.11.0 (meson also)
# apt install meson ninja-build libglib2.0-dev libcurl4-openssl-dev build-essential libssl-dev checkinstall pkg-config cmake
# RUN git clone https://megous.com/git/megatools && cd megatools && meson b && ninja -C b && ninja -C b install && rm -rf ~/megatools

CMD ["bash", "start.sh"]
