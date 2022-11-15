function pvc --wraps='latexmk --pvc' --description 'alias pvc=latexmk --pvc'
  latexmk --pvc $argv; 
end
