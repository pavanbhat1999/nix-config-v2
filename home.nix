{ inputs, lib, config, pkgs, ... }:
{
  home.username = "root99";
  home.homeDirectory = "/home/root99";
  home.stateVersion = "23.05";
  home.packages = with pkgs; [
    home-manager
    wl-clipboard
    wofi
    rofi-wayland
    tofi
    dmenu
    rofi-pass
    # rofi-emoji
    grim
    slurp
    cliphist
    eza
    swww
    vscode
    jq
    nodePackages_latest.bash-language-server
    sxiv
    pywal
    hyprland
    i3
    awesome
    # gnome3.gnome-tweaks
    lua
    sxhkd
    picom
    polybar
    lua-language-server
    mako
    swaynotificationcenter
    networkmanagerapplet
    # stalonetray
    brightnessctl
    libnotify
    dbus
    # dbus-sway-environment
    # configure-gtk
    wayland
    xdg-utils # for opening default programs when clicking links
    # glib # gsettings
    # dracula-theme # gtk theme
    # gnome3.adwaita-icon-theme  # default gnome cursors
    # swaylock
    swayidle
    swaylock-effects
    gtklock
    pass-wayland
    # sway
    pavucontrol
    # configure-gtk
    #  thunderbird
    discord
    # webcord
    # obs-studio
    fastfetch
    neofetch
    mpv
    lxmenu-data
    shared-mime-info
    # lxappearance
    eww-wayland
    ranger
    # lf
    socat # workspace switch in eww
    gnome.zenity
    gimp
    # nvidia-vaapi-driver
    # egl-wayland
    firefox
    tree
    kitty
    alacritty
    nvd
    # ventoy
    # gparted
    brave
    zsh
    git
    fzf
    ripgrep
    # gcc
    # clang
    # zig
    btop
    htop
    xclip
    # virt-manager
    OVMF # dont know what for
    nixd
    hyprpaper
    # pcmanfm
    gnome.gvfs
    # cudatoolkit
    betterdiscordctl
    tmux
    ytfzf
    ueberzugpp
    mpd
    wlr-randr
    zathura
    yt-dlp
    figlet
    playerctl
    qbittorrent
    telegram-desktop
    gammastep
    play-with-mpv
    # light
  ];

programs.waybar.enable = true;
# wayland.windowManager.sway = {
#     enable = true;
#     config = rec {
#         modifier = "Mod4";
# # Use kitty as default terminal
#         terminal = "kitty";
#     };
# };
  programs.git = {
    enable = true;
    userName = "pavanbhat1999";
    userEmail = "prbhat07@gmail.com";
    extraConfig = {
      credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
    };
  };
#vscode configs
programs.vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        vscodevim.vim
        bbenoist.nix
        yzhang.markdown-all-in-one
        enkia.tokyo-night
      ];
# userSettings =
# {
#     "workbench.colorTheme" = "Tokyo Night";
# };
  };

qt.enable = true;

# platform theme "gtk" or "gnome"
qt.platformTheme = "gtk";

# name of the qt theme
qt.style.name = "Tokyonight-Dark-B";

# detected automatically:
# adwaita, adwaita-dark, adwaita-highcontrast,
# adwaita-highcontrastinverse, breeze,
# bb10bright, bb10dark, cde, cleanlooks,
# gtk2, motif, plastique

# package to use
# qt.style.package = pkgs.adwaita-qt;

gtk = {
    enable = true;
    theme = {
        name = "Tokyonight-Dark-B";
# package = pkgs.cinnamon.mint-themes;
        package=  pkgs.tokyo-night-gtk;
    };
    iconTheme = {
        name = "kora";
# package = pkgs.papirus-icon-theme;
        package = pkgs.kora-icon-theme;
    };
    font = {
        # name = "JetBrainsMono Nerd Font";
        name = "Fira Code Retina";
        size = 12;
    };
    gtk3 = {
        extraConfig = {
            gtk-application-prefer-dark-theme = 1;
        };
    };
    gtk4 = {
        extraConfig = {
            gtk-application-prefer-dark-theme = 1;
        };
    };
};

gtk.cursorTheme.package = pkgs.bibata-cursors;
gtk.cursorTheme.name = "Bibata-Modern-Amber";

#NOTE: simple theme
# gtk = {
#     enable = true;
#     theme = {
#       name = "Materia-dark";
#       package = pkgs.materia-theme;
#     };
#   };

  # programs.zsh = {
  #   enable = true;
  #   initExtra = "export PATH=/home/root99/bin/scripts:$PATH";
  # };
# programs.waybar.package = pkgs.waybar.overrideAttrs (oa: {
#     mesonFlags = (oa.mesonFlags or  [ ]) ++ [ "-Dexperimental=true" ];
#     patches = (oa.patches or [ ]) ++ [
#       (pkgs.fetchpatch {
#         name = "fix waybar hyprctl";
#         url = "https://aur.archlinux.org/cgit/aur.git/plain/hyprctl.patch?h=waybar-hyprland-git";
#         sha256 = "sha256-pY3+9Dhi61Jo2cPnBdmn3NUTSA8bAbtgsk2ooj4y7aQ=";
#       })
#     ];
#   });
programs.home-manager.enable = true;
}
