#!/usr/bin/fish

function zr
    set projects ~/Projects/pentesting
    if set result (ls $projects/ | fzf)
        cd $projects/$result
    end
end