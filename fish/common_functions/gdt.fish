function gdt --wraps='godot4 -e 2>/dev/null >/dev/null; disown' --wraps='godot4 -e 2>/dev/null >/dev/null &; disown' --description 'alias gdt=godot4 -e 2>/dev/null >/dev/null &; disown'
  godot4 -e 2>/dev/null >/dev/null &; disown $argv; 
end
