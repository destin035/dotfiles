FROM fedora:36

RUN dnf install -y 'dnf-command(config-manager)'
RUN dnf install -y fedora-workstation-repositories
RUN dnf config-manager --set-enabled google-chrome
RUN dnf install -y google-chrome-stable
RUN dnf install -y google-noto-cjk-fonts
RUN dnf install -y i3
RUN dnf install -y neovim
RUN dnf install -y tmux
RUN dnf install -y ripgrep
RUN dnf install -y git
RUN dnf install -y python3-pip
RUN dnf install -y sudo
RUN dnf install -y gcc
RUN dnf install -y gdb
RUN dnf install -y make
RUN dnf install -y clang-devel
RUN dnf install -y meson
RUN dnf install -y mesa-dri-drivers
RUN dnf install -y alacritty
RUN dnf install -y bash-completion
RUN dnf install -y npm

RUN useradd -m -s /bin/bash destin
RUN echo "destin:destin" | chpasswd
RUN echo "destin ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER destin
WORKDIR /home/destin

# changing INCUBATOR_VER will break the cache here
ARG INCUBATOR_VER=unknown
RUN sh -c "$(curl -fsLS chezmoi.io/get)"
RUN ~/bin/chezmoi init --apply destin035
