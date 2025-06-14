set path_color 'b8bb26'
set branch_color 'fb4934'

if status is-interactive
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
    alias ga 'git add'
    alias gc 'git commit'
    alias gd 'git diff'
    alias glg 'git log'
    alias gp 'git push'
    alias gpl 'git pull'
    alias gst 'git status'
    alias py 'python -q'
    alias t 'tree -aC'
    alias config '/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
end
