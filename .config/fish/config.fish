if status is-interactive

    # ─────Colors──────────────────────────────────────────────────────────────

    set path_color 'b8bb26'
    set branch_color 'fb4934'

    # ─────Prompt──────────────────────────────────────────────────────────────

    set fish_greeting ''
    function fish_prompt
        if test "$(pwd)" = "/home/$USER"
            set path '~'
        else
            set path (basename $PWD)
        end
        set git_prompt (__fish_git_prompt)
        echo (set_color $path_color)$path(set_color $branch_color)"$git_prompt"(set_color normal)' '
    end

    # ─────Aliases─────────────────────────────────────────────────────────────

    # Git
    alias ga 'git add'
    alias gc 'git commit'
    alias gd 'git diff'
    alias gdc 'git diff --cached'
    alias gh 'git show'
    alias glg 'git log'
    alias gp 'git push'
    alias gpl 'git pull'
    alias gst 'git status'

    # Bare Git repositories
    alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
    alias wp='/usr/bin/git --git-dir=$HOME/.wp/ --work-tree=$HOME/wallpapers'

    # Other
    alias postman='/opt/Postman/Postman --ozone-platform=wayland > /dev/null &; disown'
    alias py 'python -q'
    alias t 'tree -aC'

    # ─────Env─Variables───────────────────────────────────────────────────────

    set -Ux GOPATH /home/arch/go # go
    set -Ux GPG_TTY $(tty) # disable GUI for GPG password input
    set -Ux LTS_SERVICE_DEV_MODE true

    # ─────PATH────────────────────────────────────────────────────────────────

    fish_add_path $GOPATH/bin # go
    fish_add_path /home/arch/.cargo/bin # cargo
    fish_add_path /home/arch/.local/bin # uv
end

