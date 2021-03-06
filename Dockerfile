FROM ubuntu:20.04

RUN mkdir -p /root/snort
WORKDIR /root/snort/
COPY ./snortrules-snapshot-3000.tar.gz ./
COPY ./build_snort3.sh ./

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN ./build_snort3.sh
RUN ldconfig

COPY ./build_ext.sh ./
RUN ./build_ext.sh

#RUN /bin/bash -c "snort --help && snort -v"

