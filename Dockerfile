FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND noninteractive

# package installs
RUN apt update --fix-missing
RUN apt update && apt -y install kali-linux-headless
RUN apt install -y patchelf strace ltrace ruby-full vim xclip elfutils dnsutils dirbuster checksec impacket-scripts ncat btop mc metasploit-framework hexedit seclists cmake g++ pkg-config libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev pipx
RUN gem install one_gadget

# python installs
RUN pipx install pwntools Ipython z3-solver angr

# Pwndbg install
RUN curl -qsL 'https://install.pwndbg.re' | sh -s -- -t pwndbg-gdb

# pwninit install
WORKDIR /opt
RUN wget https://github.com/io12/pwninit/releases/download/3.3.1/pwninit
RUN chmod +x pwninit

# fish
RUN apt install fish -y
RUN echo "set -U fish_prompt_pwd_dir_length 0" > /etc/fish/conf.d/00-prompt-config.fish

# set work dir
WORKDIR /chal

# python venv
RUN pipx ensurepath

# open shell and activate venv
CMD ["/bin/bash", "-c", "python3 -m venv venv && source chal/venv/bin/activate && exec /usr/bin/fish"]

