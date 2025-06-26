#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

echo "Setting up dotfiles from $DOTFILES_DIR"

create_backup() {
    local file="$1"
    if [[ -e "$file" ]] && [[ ! -L "$file" ]]; then
        mkdir -p "$BACKUP_DIR"
        echo "Backing up existing $file to $BACKUP_DIR"
        mv "$file" "$BACKUP_DIR/"
    fi
}

create_symlink() {
    local source="$1"
    local target="$2"
    
    if [[ -L "$target" ]] && [[ "$(readlink "$target")" == "$source" ]]; then
        echo "✓ $target already linked correctly"
        return
    fi
    
    create_backup "$target"
    
    echo "Creating symlink: $target -> $source"
    ln -sf "$source" "$target"
}

dotfiles=(
    ".vimrc"
    ".gitconfig" 
    ".bashrc"
)

for dotfile in "${dotfiles[@]}"; do
    source_file="$DOTFILES_DIR/$dotfile"
    target_file="$HOME/$dotfile"
    
    if [[ -f "$source_file" ]]; then
        create_symlink "$source_file" "$target_file"
    else
        echo "Warning: $source_file not found, skipping..."
    fi
done

if [[ -d "$BACKUP_DIR" ]]; then
    echo ""
    echo "Backups created in: $BACKUP_DIR"
    echo "To restore backups, run: bash $0 restore"
else
    echo ""
    echo "No backups needed - all files were already properly configured"
fi

restore_backups() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: $0 restore <backup_directory>"
        echo "Available backups:"
        ls -1d "$HOME"/.dotfiles_backup_* 2>/dev/null || echo "No backups found"
        return 1
    fi
    
    local backup_dir="$1"
    if [[ ! -d "$backup_dir" ]]; then
        echo "Error: Backup directory $backup_dir not found"
        return 1
    fi
    
    echo "Restoring from $backup_dir"
    
    for file in "$backup_dir"/*; do
        if [[ -f "$file" ]]; then
            filename=$(basename "$file")
            target="$HOME/$filename"
            
            if [[ -L "$target" ]]; then
                echo "Removing symlink: $target"
                rm "$target"
            fi
            
            echo "Restoring: $filename"
            mv "$file" "$target"
        fi
    done
    
    rmdir "$backup_dir" 2>/dev/null || true
    echo "✓ Restore complete!"
}

if [[ "$1" == "restore" ]]; then
    restore_backups "$2"
    exit 0
fi

echo ""
echo "✓ Dotfiles setup complete!"
echo "Please restart your terminal or run 'source ~/.bashrc' to apply changes."
