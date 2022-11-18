function repl --wraps='echo "kitty @ send-text --match recent:1 --stdin" | xsel -b' --description 'alias repl echo "kitty @ send-text --match recent:1 --stdin" | xsel -b'
  echo "kitty @ send-text --match recent:1 --stdin" | xsel -b $argv; 
end
