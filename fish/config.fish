if status is-interactive
    # Commands to run in interactive sessions can go here
    set -a fish_function_path ~/.config/fish/common_functions
    set -g -a PATH ~/.local/bin ~/.local/opt/julia/bin
    set -gx EDITOR kak
end
