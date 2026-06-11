SET UP
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf

nix-channel --add https://channels.nixos.org/nixos-26.05 nixpkgs
nix-channel --update

ROUTINE
nix-channel --remove ...

nix-channel --list
nix-channel --update

nix profile list
nix profile add nixpkgs#
nix profile remove
nix profile upgrade --all
nix profile history
nix profile rollback
nix profile rollback --to 1

nix-store --gc
nix-store --optimise

# Видаляємо історію старих поколінь твого користувача (залишиться тільки поточне)
nix-env --delete-generations old


