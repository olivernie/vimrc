# vimrc
Backup personal .vimrc and plugins/
# Key maps
## <kbd>Ctrl</kbd><kbd>j</kbd> or <kbd>Ctrl</kbd><kbd>k</kbd>
Move to up/down window, then maximum the window size.
## <kbd>Ctrl</kbd><kbd>h</kbd> or <kbd>Ctrl</kbd><kbd>l</kbd>
Move to left/right window, then maximum the window size.
## <kbd>Ctrl</kbd><kbd>-</kbd> or <kbd>Ctrl</kbd><kbd>+</kbd>
Shrink or enlarge the font
## <kbd>Ctrl</kbd><kbd>Up</kbd> or <kbd>Ctrl</kbd><kbd>Dn</kbd>
Move current window up or down.
## <kbd>F5</kbd>
Display buffer list.
# Commands
## Find [text]
Search current dir for files
## G [text]
Search current window and put the matching lines into a new window.
## Grep [text]
Search current folder for text files. Then execute grep *text* from the found files. If *text* is omitted, use vim register '/' as text.
## Cgrep [text]
Search current folder for C/C++ source/header files. Then execute grep *text* from the found files. If *text* is omitted, use vim register '/' as text.
## P4grep [text]
Search current folder for P4 files. Then execute grep *text* from the found files. If *text* is omitted, use vim register '/' as text.
## Tlist
Toggle the Tlist tags window.

# Syntax
## P4 file
Install p4.vim to <HOME>/.vim/syntax.
