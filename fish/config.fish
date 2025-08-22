# Detect OS and set Homebrew path
if test (uname) = Darwin
    # macOS
    set -gx HOMEBREW_PREFIX /opt/homebrew
else if test (uname) = Linux
    # Linux (including WSL)
    set -gx HOMEBREW_PREFIX /home/linuxbrew/.linuxbrew
end
set -gx PATH $HOMEBREW_PREFIX/bin $HOMEBREW_PREFIX/sbin $PATH

if type -q brew
    eval (brew shellenv)
end

starship init fish | source
zoxide init fish | source
fzf --fish | source

set -Ux EDITOR nvim

fish_vi_key_bindings

abbr gco 'git checkout'
abbr gs 'git status'
abbr gl 'git pull'
abbr gp 'git push'
abbr gcb 'git checkout -b'
abbr ga 'git add'
abbr ga. 'git add .'
abbr gcm 'git commit -m'
abbr .. 'z ..'
abbr ... 'z ../..'
abbr c clear
abbr nv nvim

# ---------------------------
# Fancy file finder with preview
# ---------------------------
function ff
    # Use fd if available, fallback to find
    if type -q fd
        set files (fd .)
    else
        set files (find . -type f)
    end

    # Launch fzf with preview using bat
    set file (printf "%s\n" $files | fzf \
        --height 40% \
        --layout=reverse \
        --border \
        --preview 'bat --style=numbers --color=always {} | head -200' \
        --preview-window=right:60%:wrap \
    )

    if test -n "$file"
        $EDITOR $file
    end
end

# Shortcuts
abbr ff ff
