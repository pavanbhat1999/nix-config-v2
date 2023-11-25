{ inputs, lib, config, pkgs, ... }:
{
  imports = [ inputs.ags.homeManagerModules.default ];
  home.username = "root99";
  home.homeDirectory = "/home/root99";
  home.stateVersion = "23.05";
  home.packages = with pkgs; [
    home-manager
    wl-clipboard
    sassc
    hyprpicker
    google-chrome
    libreoffice-qt
    hunspell
    hunspellDicts.uk_UA
    hunspellDicts.th_TH
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
    # hyprland
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
    brightnessctl
    libnotify
    dbus
    wayland
    xdg-utils # for opening default programs when clicking links
    # glib # gsettings
    # swaylock
    swayidle
    swaylock-effects
    gtklock
    pass-wayland
    # sway
    pavucontrol
    #  thunderbird
    discord
    obs-studio
    fastfetch
    neofetch
    mpv
    lxmenu-data
    shared-mime-info
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
  programs.ags = {
    enable = true;

    # null or path, leave as null if you don't want hm to manage the config
    # configDir = null;

    # packages to add to gjs's runtime
    extraPackages = [ pkgs.libsoup_3 ];
  };
# wayland.windowManager.hyprland = {
#     enable = true;
#     plugins = [
#         inputs.hycov.packages.${pkgs.system}.hycov
#     ];
#     extraConfig = ''
#         bind = CTRL_ALT,h,hycov:enteroverview
#         bind = CTRL_ALT,m,hycov:leaveoverview
#         bind = CTRL_ALT,k,hycov:toggleoverview
#         bind=ALT,left,hycov:movefocus,l
#         bind=ALT,right,hycov:movefocus,r
#         bind=ALT,up,hycov:movefocus,u
#         bind=ALT,down,hycov:movefocus,d
#
#         plugin {
#             hycov {
#                 overview_gappo = 60 #gas width from screem
#                     overview_gappi = 24 #gas width from clients
#                     hotarea_size = 10 #hotarea size in bottom left,10x10
#                     enable_hotarea = 1 # enable mouse cursor hotarea
#             }
#         }
#     '' + ''
# # your othor config
#
# # This is an example Hyprland config file.
# #
# # Refer to the wiki for more information.
# # source = ~/.config/hypr/env.conf
# #
# # Please note not all available settings / options are set here.
# # For a full list, see the wiki
# #
#
# # See https://wiki.hyprland.org/Configuring/Monitors/
#
# # monitor=,preferred,auto,1
# monitor=eDP-1, preferred, 1920x0, 1
# monitor=HDMI-A-2, preferred, 0x0, 1
#
# # See https://wiki.hyprland.org/Configuring/Keywords/ for more
#
# # Execute your favorite apps at launch
# # Source a file (multi-file configs)
# # source = ~/.config/hypr/myColors.conf
#
# # Some default env vars.
# env = XCURSOR_SIZE,24
#
# # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
# input {
#     kb_layout = us
#     kb_variant =
#     kb_model =
#     kb_options = pgdown:none
#     kb_rules =
#
#     follow_mouse = 1
#
#     touchpad {
#         natural_scroll = true
#     }
#
#     sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
# }
#
# general {
#     # See https://wiki.hyprland.org/Configuring/Variables/ for more
#
#     gaps_in = 5
#     gaps_out = 5
#     border_size = 2
#     col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
#     col.inactive_border = rgba(595959aa)
#     layout = dwindle
#     cursor_inactive_timeout = 30
# }
# misc {
#         focus_on_activate = true
#         disable_hyprland_logo = true
#         # force_hypr_chan = true
#         disable_splash_rendering = true
#         allow_session_lock_restore = true
#         close_special_on_empty = true
# }
#
# decoration {
#     # See https://wiki.hyprland.org/Configuring/Variables/ for more
#
#     rounding = 10
#     drop_shadow = false
#     shadow_range = 4
#     shadow_render_power = 3
#     col.shadow = rgba(1a1a1aee)
#     # blur = false
#     # blur_size = 3
#     # blur_passes = 1
#     # blur_new_optimizations = true
#         blur{
#             blur:enabled = false
#             blur:size = 3
#             blur:passes = 1
#         }
#
# }
#
# animations {
#     enabled = true
#
#     # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
#
#     bezier = myBezier, 0.05, 0.9, 0.1, 1.05
#     bezier = liner, 1, 1, 1, 1
#
#     animation = windows, 1, 7, myBezier,slide
#     animation = windowsOut, 1, 7, default, slide
#     animation = windowsMove,1,7,myBezier,slide
#     animation = border, 1, 10, default
#     animation = borderangle, 1, 8, default
#     animation = fade, 1, 7, default
#     animation = workspaces, 1, 6, default
#     #animation on border color
#     # animation = borderangle, 1, 30, liner, loop
# #NOTE: copied animations
#     #     enabled = yes
#     # bezier = wind, 0.05, 0.9, 0.1, 1.05
#     # bezier = winIn, 0.1, 1.1, 0.1, 1.1
#     # bezier = winOut, 0.3, -0.3, 0, 1
#     # bezier = liner, 1, 1, 1, 1
#     # animation = windows, 1, 6, wind, slide
#     # animation = windowsIn, 1, 6, winIn, slide
#     # animation = windowsOut, 1, 5, winOut, slide
#     # animation = windowsMove, 1, 5, wind, slide
#     # animation = border, 1, 1, liner
#     # animation = borderangle, 1, 30, liner, loop
#     # animation = fade, 1, 10, default
#     # animation = workspaces, 1, 5, wind
# }
#
# dwindle {
#     # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
#     pseudotile = true # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
#     preserve_split = true # you probably want this
#     no_gaps_when_only = true
# }
#
# master {
#     # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
#     new_is_master = true
#     # new_on_top = true
# }
#
# gestures {
#     # See https://wiki.hyprland.org/Configuring/Variables/ for more
#     workspace_swipe = true
# }
#
# # Example per-device config
# # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
# device:epic-mouse-v1 {
#     sensitivity = -0.5
# }
#
# binds {
#     allow_workspace_cycles=true
#     workspace_back_and_forth=true
# }
# # Example windowrule v1
# # windowrule = float, ^(kitty)$
# # Example windowrule v2
# # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
# # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
#
#
# # See https://wiki.hyprland.org/Configuring/Keywords/ for more
# $mainMod = SUPER
#
#
# # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
# # bind = $mainMod, Return, exec, kitty
# bind = $mainMod, Return, exec, foot
# bind = $mainMod SHIFT, Q, killactive,
# bind = $mainMod SHIFT , B , exec , brave
# bind = $mainMod SHIFT , C , exec , thorium
# bind = $mainMod SHIFT , F , exec , firefox
# bind = ALT,m,exec,rofi-beats
# bind = $mainMod SHIFT CTRL, E, exit,
# bind = $mainMod, N, exec, dolphin
# bind = $mainMod ALT,SPACE,exec,kitty -e ranger
# bind = $mainMod SHIFT, SPACE, togglefloating,
# # bind = $mainMod, x, exec,wofi --show drun
# # bind = $mainMod, r, exec,wofi --show drun
# # bindr = $mainMod,SUPER_L,exec,wofi --show drun
# # bindr = $mainMod,SUPER_L,exec,/home/root99/.config/rofi/launchers/type-7/launcher.sh || pkill rofi
# bindr = $mainMod,SUPER_L,exec,ags -t applauncher
# # bind = $mainMod,E,exec,rofi -modi emoji -show emoji
# # bind = $mainMod, P, pseudo, # dwindle
# bind = $mainMod,P,exec,passmenu-wl
# # bind = $mainMod,P,exec,rofi-pass
# bind = $mainMod, J, togglesplit, # dwindle
# # bind = $mainMod, W, exec,
#
# # Move focus with mainMod + arrow keys
# bind = $mainMod, left, movefocus, l
# bind = $mainMod, right, movefocus, r
# bind = $mainMod, up, movefocus, u
# bind = $mainMod, down, movefocus, d
#
# # Switch workspaces with mainMod + [0-9]
# bind = $mainMod, 1, workspace, 1
# bind = $mainMod, 2, workspace, 2
# bind = $mainMod, 3, workspace, 3
# bind = $mainMod, 4, workspace, 4
# bind = $mainMod, 5, workspace, 5
# bind = $mainMod, 6, workspace, 6
# bind = $mainMod, 7, workspace, 7
# bind = $mainMod, 8, workspace, 8
# bind = $mainMod, 9, workspace, 9
# bind = $mainMod, 0, workspace, 10
#
# # Move active window to a workspace with mainMod + SHIFT + [0-9]
# bind = $mainMod SHIFT, 1, movetoworkspace, 1
# bind = $mainMod SHIFT, 2, movetoworkspace, 2
# bind = $mainMod SHIFT, 3, movetoworkspace, 3
# bind = $mainMod SHIFT, 4, movetoworkspace, 4
# bind = $mainMod SHIFT, 5, movetoworkspace, 5
# bind = $mainMod SHIFT, 6, movetoworkspace, 6
# bind = $mainMod SHIFT, 7, movetoworkspace, 7
# bind = $mainMod SHIFT, 8, movetoworkspace, 8
# bind = $mainMod SHIFT, 9, movetoworkspace, 9
# bind = $mainMod SHIFT, 0, movetoworkspace, 10
#
# # Scroll through existing workspaces with mainMod + scroll
# bind = ALT, Tab, workspace, previous
# # bind = ALT, Tab ,workspace,e+1
# bind = $mainMod, bracketleft , workspace, m-1
# bind = $mainMod, bracketright , workspace, m+1
# bind = $mainMod, F  , fullscreen
# bind = $mainMod, M  , fullscreen , 1
# # bind = $mainMod,Tab,exec,rofi -show window
# bind = $mainMod,Tab,workspace,m+1
# # bind = ALT,Tab,cyclenext
# # bind = $mainMod,Tab,exec,eww --config $HOME/.config/eww/hyprmsn open hyprmsn
# # bind = ALT,Tab,bringactivetotop
#
# # Move/resize windows with mainMod + LMB/RMB and dragging
# bindm = $mainMod, mouse:272, movewindow
# bindm = $mainMod, mouse:273, resizewindow
#
# # MY Custom shortcuts-------------------------------------------------------------------------------
# bind = $mainMod SHIFT, S,exec,grim -g "$(slurp)" - | wl-copy
# bind = ALT,P,exec,rofi-power-menu
# # bind = $mainMod,d,exec,tofi-drun --fuzzy-match true
# bind = $mainMod,d,exec,rofi -show run
# bind = $mainMod,c,exec,custom-menu
# bind = $mainMod,XF86MonBrightnessUp, exec, light -A 2
# bind = $mainMod,XF86MonBrightnessDown, exec, light -U 2
# # bind = $mainMod,V,exec,cliphist list | wofi -dmenu | cliphist decode | wl-copy
# bind = $mainMod,V,exec,cliphist list | rofi -dmenu | cliphist decode | wl-copy
# bind = $mainMod SHIFT,minus,movetoworkspace,special
# bind = $mainMod,minus,togglespecialworkspace
# bind = $mainMod,W,exec,toggle-waybar.sh
# # bind = $mainMod SHIFT,k,movetoworkspace,1
# # bind = $mainMod,e,togglegroup
# bind = $mainMod,s,pin
# #TODO: Add global shortcut for obs
# bind = SUPER_ALT,F10,pass,^(com\.obsproject\.Studio)$
# bind = SUPER_ALT,F11,pass,^(com\.obsproject\.Studio)$
# bind = SUPER,F1,exec,eww open workspaces-window
# bind = SUPER ALT,F1,exec,eww close workspaces-window
# #NOTE: hardcoded this link because temporary
# bind = SUPER,y,exec,/home/root99/dev/music-searx/searx-music.sh
#
# #exec-once=/usr/lib/polkit-kde-authentication-agent-1
# exec-once=/home/root99/kill-xdg.sh
# exec-once=/nix/store/$(ls -la /nix/store | grep polkit-kde-agent | grep '^d' | awk '{print $9}' | head -1)/libexec/polkit-kde-authentication-agent-1
# # exec-once=waybar
# exec-once=ags
# exec-once=blueman-applet
# # exec-once=eww open workspaces-window
# # exec-once=eww open wallpaper-window
# # exec-once=eww open wallpaper-window1
# # exec-once=hyprpaper
# exec-once=sleep 1;swww init
# # exec-once=mako /home/root99/.config/mako/config
# # exec-once=swaync
# exec-once=gammastep -P -O 5000k
# exec-once=nm-applet
# # exec-once=wal -R
# exec-once = wl-paste --type text --watch cliphist store #Stores only text data
# exec-once = wl-paste --type image --watch cliphist store #Stores only image data
# exec-once = swayidle -w timeout 600 "systemctl suspend" before-sleep "my-lock-screen.sh" & disown
# exec-once = hyprctl setcursor Bibata-Modern-Amber 24
#
# windowrule=workspace 2,^(brave-browser)$
# windowrule=workspace 8,^(thorium-browser)$
# windowrule=workspace 7,^(firefox)$
# windowrule=workspace 6,^(WebCord)$
# windowrule=workspace 6,^(discord)$
# windowrule=workspace 5,^(mpv)$
# windowrule=workspace 4,^(Code)$
# windowrule=workspace 4,^(code-url-handler)$
# windowrule=workspace special,^(Spotify)$
# # windowrule=opacity 0.8 0.8,^(Pcmanfm)$
# # windowrule=opacity 0.9 0.9,^(Code)$
# windowrule=opacity 0.9 0.9,^(com.spotify.Client)$
# windowrule=float,^(org.kde.polkit-kde-authentication-agent-1)$
# windowrule=float,title:^(ranger)$
# windowrule=size 70% 70%,title:^(ranger)$
# windowrule=workspace 1,^(Flutter_application_1)$
# windowrule=float,title:^(Firefox — Sharing Indicator)$
# # windowrule=animation popin,^(kitty)$
# # windowrule=animation popin,^(eww)$
# # windowrule=float,^(Spotify)$
# # windowrule=size 50% 50%,^(Spotify)$
# # windowrule=move 50% 50%,^(Spotify)$
#
# #workspace rules
# # workspace=7,gapsin:0,gapsout:0,bordersize:0,rounding:false
# # workspace=4,gapsin:0,gapsout:0,bordersize:0,rounding:false
# # workspace=2,gapsin:0,gapsout:0,bordersize:0,rounding:false
# workspace=eDP-1,9,default:true
# workspace=HDMI-A-2,1,default:true
# workspace=HDMI-A-2,2,default:true
#
# exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
# # exec-once=wlr-randr  --output eDP-1 --off
#
# #blur for specific
# blurls = waybar
# blurls = wofi
# # blurls = rofi
# blurls = launcher
# # blurls = eww-bar
# blurls=gtk-layer-shell
# # NOTE:Added for blur
# layerrule=ignorezero,eww-sys
# layerrule=ignorezero,eww-bar
# layerrule=ignorezero,eww-media-player
# # layerrule=ignorezero,rofi
# layerrule=blur,eww-sys
# layerrule=blur,eww-bar
# # layerrule=blur,rofi
# layerrule=blur,eww-media-player
# #monitor setup
# # NOTE: deprecated
# # wsbind=1,eDP-1
# # wsbind=5,HDMI-A-2
# bindl=,switch:off:Lid Switch,exec,hyprctl keyword monitor "eDP-1, 1920x1080, 0x0, 1"
# bindl=,switch:on:Lid  Switch,exec,hyprctl keyword monitor "eDP-1, disable"
# # make this using a keybind
# # monitor=eDP-1,disable
#
#         '';
# };
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
