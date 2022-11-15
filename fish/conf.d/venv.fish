function venv --wraps='cr && source venv/bin/activate.fish 2>/dev/null || python -m venv venv --prompt (basename (root)) && source venv/bin/activate.fish' --description 'alias venv cr && source venv/bin/activate.fish 2>/dev/null || python -m venv venv --prompt (basename (root)) && source venv/bin/activate.fish'
  cr && source venv/bin/activate.fish 2>/dev/null || python -m venv venv --prompt (basename (root)) && source venv/bin/activate.fish $argv; 
end
