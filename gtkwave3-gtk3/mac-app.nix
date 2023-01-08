{ pkgs ? import <nixpkgs> {} }:
pkgs.callPackage ./mac-app-derivation.nix {}
