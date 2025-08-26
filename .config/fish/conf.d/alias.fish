abbr pdf zathura
alias dotfiles '/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias mailsync 'systemctl --user start mbsync.service'
alias rules 'pdf ~/Documents/HULKs/SPL-Rules-master.pdf'
alias pass gopass
alias gpc "gopass -c"
alias exa eza
alias evince "flatpak run org.gnome.Evince"
alias okular "flatpak run org.kde.okular"
alias tree "exa --tree --level=3"
alias o "xdg-open"
alias logs_download "wget -m -np -nH -c -R \"index.html\""
alias mpv "flatpak run io.mpv.Mpv"
alias firefox "flatpak run org.mozilla.firefox"
alias zen "flatpak run app.zen_browser.zen"
alias tcm "cd ~/worktree/hulks/GameController/RoboCup2025/GameController/ && _JAVA_AWT_WM_NONREPARENTING=1 java -jar TeamCommunicationMonitor.jar"
