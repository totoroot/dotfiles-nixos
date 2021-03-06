{ config, options, lib, pkgs, ... }:

with lib;
with lib.my;
let cfg = config.modules.shell.git;
in {
  options.modules.shell.git = {
    enable = mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    user.packages = with pkgs; [
      gitAndTools.gitFull
      lazygit 				# terminal ui for git
      onefetch 				# git repo summary
    ];

    home.configFile = {
      "git/config".source = "${configDir}/git/config";
      "git/ignore".source = "${configDir}/git/ignore";
    };

    modules.shell.zsh.rcFiles = [ "${configDir}/git/aliases.zsh" ];
  };
}
