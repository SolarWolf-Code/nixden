# show this list
@default:
    just --list 

# rebuild using flake
@build:
    sudo nixos-rebuild switch --flake .