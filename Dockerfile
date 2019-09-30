FROM alpine
RUN apk add --update vim yasm gcc g++ gdb git llvm cmake python python3 linux-headers bash\
  && rm -rf /var/cache/apk/*
COPY foo.asm /root/


# c和assembly的混编
RUN apk add cmake make gcc libtool musl-dev && rm -rf /var/cache/apk/*
COPY asm.c /root/

# 安装gef
RUN apk add wget && rm -rf /var/cache/apk/*
RUN pip3 install keystone-engine unicorn capstone
RUN pip3 install ropper
RUN wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh
