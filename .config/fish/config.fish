source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

# opencode
fish_add_path /home/victor/.opencode/bin

# dotfiles bare repo alias
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfilesgit/ --work-tree=$HOME'

# other alias
alias fm='yazi'

function ensure_data_drive
    set luks_device /dev/nvme0n1p1
    set mapper_device /dev/mapper/luks-ba7c4b33-645e-4f7e-9db7-9918faa017f4
    set mount_point "/run/media/$USER/data"

    if not test -d "$mount_point"
        if not test -e "$mapper_device"
            echo "Unlocking data drive..."
            udisksctl unlock -b "$luks_device"
        end

        if not test -d "$mount_point"
            echo "Mounting data drive..."
            udisksctl mount -b "$mapper_device"
        end
    end
end

function data
    ensure_data_drive
    cd /run/media/$USER/data
end

function projects
    ensure_data_drive
    cd /run/media/$USER/data/projects
end

# starship prompt
starship init fish | source
