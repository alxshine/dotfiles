#!/usr/bin/awk

{
l=$4;
for(i=5; i<=NF; ++i){
  l=sprintf("%s:%s", l, $i);
}
# system("cat " $1 " | rg '"l"'")
system("(highlight -O ansi 2>/dev/null " $1 " || cat " $1 ") | rg --context 30 --pretty --colors 'match:bg:yellow' -F '" l "'")
}
