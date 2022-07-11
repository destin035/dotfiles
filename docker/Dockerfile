FROM fedora:36

RUN dnf install -y 'dnf-command(config-manager)'
RUN rpm --import https://packages.microsoft.com/keys/microsoft.asc
RUN dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/edge
RUN dnf install -y microsoft-edge-stable
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
RUN dnf install -y supervisor
RUN dnf install -y openssh-server
RUN dnf install -y xrdp
RUN dnf install -y xorgxrdp

RUN ssh-keygen -A
RUN useradd -m -s /bin/bash destin
RUN echo "destin:destin" | chpasswd
RUN echo "destin ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER destin

RUN mkdir -p ~/workspace ~/.local/bin
RUN sh -c "$(curl -fsLS chezmoi.io/get)" -- -b ~/.local/bin

ARG INCUBATOR_VER=unknown
RUN ~/.local/bin/chezmoi init --apply destin035

USER root

COPY supervisord.conf /etc/supervisord.conf
COPY sesman.ini /etc/xrdp/sesman.ini
COPY xrdp.ini /etc/xrdp/xrdp.ini
CMD ["/usr/bin/supervisord"]
