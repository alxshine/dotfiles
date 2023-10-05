function symsearch --wraps='nm -o --defined-only --demangle (find -name "**.so" -o -name "**.a" -o -name "**.o") | fzf' --description 'alias symsearch nm -o --defined-only --demangle (find -name "**.so" -o -name "**.a" -o -name "**.o") | fzf'
  nm -o --defined-only --demangle (find -name "**.so" -o -name "**.a" -o -name "**.o") | fzf $argv
        
end
