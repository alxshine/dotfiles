#!/usr/bin/fish

function zt
    set tools ~/Tools
    if set result (ls $tools/ | fzf)
        cd $tools/$result
    end
end