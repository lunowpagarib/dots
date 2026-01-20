source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

alias pqs='pacman -Qs'
alias cls='clear'
alias ls='la'
alias zed='zeditor'
alias fastfetch='fastfetch --logo small'

function copy
    set count (count $argv)
    if test "$count" = 2 -a -d "$argv[1]"
        set from (echo $argv[1] | tr -d '/')
        set to $argv[2]
        command cp -r "$from" "$to"
    else
        command cp $argv
    end
end
