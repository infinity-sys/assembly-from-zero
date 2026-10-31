# Dockerfile - the course lab: Ubuntu 24.04, x86-64
FROM --platform=linux/amd64 ubuntu:24.04
RUN apt-get update && apt-get install -y \
    nasm binutils gdb make file
WORKDIR /lab
CMD ["bash"]
