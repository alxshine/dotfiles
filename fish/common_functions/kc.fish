function kc --description 'connect to kak session in current project'
  set name (broot)
  set uid (id -u)
  set socket_file "/run/user/$uid/kakoune/$name"
  if test ! -e $socket_file
        kak -d -s $name &
        sleep 0.1
        disown
  end
  kak -c $name $argv
end
