#!/bin/fish

killall -q polybar
for line in (polybar -m)
  echo $line | cut -f 1 -d ":" | read monitor
  if echo $line | rg primary > /dev/null
    set bar primary
  else
    set bar secondary
  end

  MONITOR=$monitor polybar $bar 2>/dev/null &
end

