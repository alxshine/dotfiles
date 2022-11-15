function root --wraps='git rev-parse --show-toplevel || pwd' --wraps='git rev-parse --show-toplevel 2>/dev/null || pwd' --description 'alias root git rev-parse --show-toplevel 2>/dev/null || pwd'
  git rev-parse --show-toplevel 2>/dev/null || pwd $argv; 
end
