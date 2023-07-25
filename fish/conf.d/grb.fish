function grb --wraps='git rebase (git rev-parse --abbrev-ref HEAD)' --wraps='git rebase (git rev-parse --abbrev-ref origin/HEAD)' --description 'alias grb git rebase (git rev-parse --abbrev-ref origin/HEAD)'
  git fetch && git rebase (git rev-parse --abbrev-ref origin/HEAD) $argv
        
end
