# Python
hook global BufSetOption filetype=python %{
  set-option buffer formatcmd 'black -'
  set-option buffer tabstop 4
  set-option buffer indentwidth 4
}

# JSON
hook global BufSetOption filetype=json %{
  set-option buffer formatcmd 'jq'
}

# LaTeX
hook global BufCreate .*\.(tex|bib) %{
  set-option buffer formatcmd 'latexindent'
}

# yaml
hook global BufSetOption filetype=yaml %{
  set-option buffer formatcmd 'yq -y . -'
}

# C/C++
hook global BufSetOption filetype=(c|cpp|h) %{
  set-option buffer formatcmd 'clang-format -'
}

# Godot
hook global BufCreate .*\.gd %{
  map buffer insert <tab> '<a-;><a-gt>'
  map buffer insert <s-tab> '<a-;><a-lt>'
  set-option buffer indentwidth 0
  set-option buffer tabstop 2
}

