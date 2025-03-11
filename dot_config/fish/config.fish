if status is-interactive
    # Commands to run in interactive sessions can go here

    # Overwrite fish_greeting
    set fish_greeting

    # Initialize Oh My Posh
    oh-my-posh init fish --config ~/.config/ohmyposh/omp.toml | source

    # Set up fzf key bindings
    fzf --fish | source;

    # Shell plugin
    atuin init fish | source


    function nvims
        set -l items Default LazyVim
        set -l config (printf "%s\n" $items | fzf --prompt=" Neovim Config   " --height=~50% --layout=reverse --border --exit-0)

        if test -z "$config"
            echo "Nothing selected"
            return 0
        else if test "$config" = Default
            set config ""
        end

        env NVIM_APPNAME=$config nvim $argv
    end

    function in
        # Select a file with fzf and preview it using bat, then open it in Neovim
        set selected_file (fzf --preview 'bat --style numbers --color always --line-range :300 {}')

        if test -n "$selected_file"
          nvim $selected_file
        end
    end

    # Yazi shell wrapper
    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            builtin cd -- "$cwd"
	end
        rm -f -- "$tmp"
    end

    alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
    alias nvim-test="NVIM_APPNAME=NvimTest nvim"
    alias lc="eza -la --no-user --icons --no-time --no-permissions --no-filesize" # ls clean
    alias l="eza --long --total-size -h -F --icons" # Extended details with binary sizes and type indicators
    alias ll="eza --long --total-size -ha -F --icons" # Long format, including hidden files
    alias ls="eza --icons"
    alias n="nvim"
    alias ff="fastfetch"
    alias lg="lazygit"
    alias lz="lazydocker"

    zoxide init fish | source

        # TokyoNight Color Palette
    set -l foreground c0caf5
    set -l selection 283457
    set -l comment 565f89
    set -l red f7768e
    set -l orange ff9e64
    set -l yellow e0af68
    set -l green 9ece6a
    set -l purple 9d7cd8
    set -l cyan 7dcfff
    set -l pink bb9af7

    # Syntax Highlighting Colors
    set -g fish_color_normal $foreground
    set -g fish_color_command $cyan
    set -g fish_color_keyword $pink
    set -g fish_color_quote $yellow
    set -g fish_color_redirection $foreground
    set -g fish_color_end $orange
    set -g fish_color_option $pink
    set -g fish_color_error $red
    set -g fish_color_param $purple
    set -g fish_color_comment $comment
    set -g fish_color_selection --background=$selection
    set -g fish_color_search_match --background=$selection
    set -g fish_color_operator $green
    set -g fish_color_escape $pink
    set -g fish_color_autosuggestion $comment

    # Completion Pager Colors
    set -g fish_pager_color_progress $comment
    set -g fish_pager_color_prefix $cyan
    set -g fish_pager_color_completion $foreground
    set -g fish_pager_color_description $comment
    set -g fish_pager_color_selected_background --background=$selection

    # Set the EDITOR and VISUAL environment variables
    set -gx EDITOR nvim
    set -gx VISUAL cursor

end
