function rocode
    set selection (ls ~/Projects/ | rofi -dmenu)
    if test $status -ne 0
        return
    end
    code ~/Projects/$selection/
end
