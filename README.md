# nixden

My dotfiles for [nixos](https://nixos.org/)


## Setup
- Add `git` to in your packages section of `/etc/nixos/configuration.nix`:  
```
environment.systemPackages = with pkgs; [
    git
    micro # might as well add this for easier editing
];
```
- Rebuild to install git
``` shell
sudo nixos-rebuild switch
```

- Clone this repo
```shell
git clone https://github.com/solarwolf-code/nixosden.git
```


