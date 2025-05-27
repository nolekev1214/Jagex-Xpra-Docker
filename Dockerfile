FROM fedora:latest
LABEL maintainer="nolekev1214"

RUN dnf update -y && dnf install -y wget openssl

RUN wget -O /etc/yum.repos.d/xpra.repo https://raw.githubusercontent.com/Xpra-org/xpra/master/packaging/repos/Fedora/xpra.repo
RUN dnf update -y && dnf install -y xpra xpra-html5 xterm

RUN dnf install -y flatpak
RUN flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
RUN flatpak remote-add --if-not-exists JagexLauncher https://jagexlauncher.flatpak.mcswain.dev/JagexLauncher.flatpakrepo
RUN flatpak install -y flathub org.freedesktop.Platform.Compat.i386/x86_64/23.08
RUN flatpak install -y flathub org.freedesktop.Platform.GL32.default/x86_64/23.08
RUN flatpak install -y JagexLauncher com.jagex.Launcher
RUN flatpak install -y JagexLauncher com.jagex.Launcher.ThirdParty.RuneLite
RUN flatpak install -y JagexLauncher com.jagex.Launcher.ThirdParty.HDOS

ARG LOGIN_PASSWORD="osrs"
ENV XPRA_PASSWORD=LOGIN_PASSWORD

CMD ["xpra", "start", "--start=xterm", "--bind-tcp=0.0.0.0:10000,auth=env", "--daemon=no"]