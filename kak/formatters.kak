# Python
hook global BufSetOption filetype=python %{
	set-option buffer formatcmd 'black -'
}

# JSON
hook global BufSetOption filetype=json %{
    set-option buffer formatcmd 'jq'

}

# LaTeX
hook global BufSetOption filetype=latex %{
    set-option buffer formatcmd 'latexindent'
}

# yaml
hook global BufSetOption filetype=yaml %{
    set-option buffer formatcmd 'yq -y . -'
}
