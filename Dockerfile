FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND noninteractive

# package installs
RUN apt update --fix-missing
RUN apt update && apt -y install kali-linux-headless
RUN apt install -y patchelf strace ltrace ruby-full vim xclip elfutils dnsutils dirbuster checksec impacket-scripts ncat btop mc
RUN gem install one_gadget
RUN pip3 install pwntools Ipython angr z3-solver ropper

# Pwndbg install
WORKDIR /opt
RUN git clone https://github.com/pwndbg/pwndbg
WORKDIR /opt/pwndbg
ENV LC_ALL=C.UTF-8
RUN ./setup.sh

# pwninit install
WORKDIR /opt
RUN wget https://github.com/io12/pwninit/releases/download/3.3.1/pwninit
RUN chmod +x pwninit

# set work dir
WORKDIR /chal

# open shell
CMD ["/bin/bash"]
