function gpublish --wraps='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)' --description 'alias gpublish git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
  git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD) $argv
        
end
