#!/usr/bin/fish

function zp
    set projects ~/Projects
    if set result (ls $projects/ | fzf)
        cd $projects/$result
    end
end