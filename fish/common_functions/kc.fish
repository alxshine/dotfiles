function kc --description 'connect to kak session in current project'
  set name (broot)
  set socket_file "/run/user/(id -u)/kakoune/$name"
  if test ! -e $socket_file
        kak -d -s $name &
        sleep 0.1
        disown
  end
  kak -c $name $argv
end
