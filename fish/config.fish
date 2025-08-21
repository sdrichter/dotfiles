# This block initializes Homebrew by running 'brew shellenv'
# and evaluating its output directly in the shell.
# It's a more robust approach for this specific command.
if command -v brew >/dev/null
    echo "Initializing Homebrew..."
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
abbr .. 'z ..'
abbr ... 'z ../..'
abbr cd z

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

set -Ux LEDGER_FILE ~/plaintextaccounting/hledger/main.journal
