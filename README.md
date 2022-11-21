# infrastructure

Everything I use to configure and manage my own personal infrastructure.

## /nix

I use NixOS for declarative baremetal configuration. Since most of my stuff (computers, servers, etc.) are not
cloud-based, most of my infrastructure is handled by Nix.

I've decided to use Nix Flakes since they are definitely the future. I am also using Home Manager for my user
configuration, inside the same flake. I decided against using the NixOS module of Home Manager because I wanted to take
advantage of Home Manager's multi system support (and also be able to hack on my home configuration without needing to
create a new boot entry each time).

## /terraform (wip)

I plan to move as much of my cloud infrastructure as possible to Terraform. Ideally this would also run in CI/ CD and
update when changes are pushed to `main`.
