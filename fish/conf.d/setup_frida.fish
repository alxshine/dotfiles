function setup_frida --wraps='sudo sysctl kernel.yama.ptrace_scope=0' --description 'alias setup_frida=sudo sysctl kernel.yama.ptrace_scope=0'
  sudo sysctl kernel.yama.ptrace_scope=0 $argv
        
end
