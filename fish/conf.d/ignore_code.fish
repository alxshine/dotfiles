function ignore_code --wraps='echo ".vscode" >> (root)/.git/info/exclude' --description 'alias ignore_code echo ".vscode" >> (root)/.git/info/exclude'
  echo ".vscode" >> (root)/.git/info/exclude $argv
        
end
