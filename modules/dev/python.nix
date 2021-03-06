# modules/dev/python.nix

{ config, options, lib, pkgs, my, ... }:

with lib;
with lib.my;
let cfg = config.modules.dev.python;
in {
  options.modules.dev.python = {
    enable = mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    user.packages = with pkgs; [
      python38
      python38Packages.pip
      python38Packages.pipdate    # pip update helpers
      python38Packages.virtualenv
      python38Packages.pytest-virtualenv
      python38Packages.virtualenv-clone
      python38Packages.tox
      python38Packages.ipython
      python38Packages.setuptools
      python38Packages.pylint
      python38Packages.poetry     # Python dependency management and packaging made easy
      python38Packages.jupyterlab # Jupyter lab environment notebook server extension
      # python38Packages.jupytext   # Jupyter notebooks as Markdown documents, Julia, Python or R scripts
      ansible                     # automation tool
      ansible-lint                # linter for ansible
      unstable.esptool            # ESP8266 and ESP32 serial bootloader utility
      unstable.micropython        # Python implementation for MCUs
    ];

    env.IPYTHONDIR      = "$XDG_CONFIG_HOME/ipython";
    env.PIP_CONFIG_FILE = "$XDG_CONFIG_HOME/pip/pip.conf";
    env.PIP_LOG_FILE    = "$XDG_DATA_HOME/pip/log";
    env.PYLINTHOME      = "$XDG_DATA_HOME/pylint";
    env.PYLINTRC        = "$XDG_CONFIG_HOME/pylint/pylintrc";
    env.PYTHONSTARTUP   = "$XDG_CONFIG_HOME/python/pythonrc";
    env.PYTHON_EGG_CACHE = "$XDG_CACHE_HOME/python-eggs";
    env.JUPYTER_CONFIG_DIR = "$XDG_CONFIG_HOME/jupyter";

    environment.shellAliases = {
      py     = "python";
      py2    = "python2";
      py3    = "python3";
      po     = "poetry";
      ipy    = "ipython --no-banner";
      ipylab = "ipython --pylab=qt5 --no-banner";
    };
  };
}
