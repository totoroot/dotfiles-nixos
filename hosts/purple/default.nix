{ ... }:
{
  imports = [
    ../personal.nix
    ./hardware-configuration.nix
  ];

  ## Modules
  modules = {
    desktop = {
      bspwm.enable		  = true;
      documents.enable 	= true;
      keepassxc.enable 	= true;
      mail.enable      	= true;
      thunar.enable     = true;
      vscodium.enable   = true;
      apps = {
        rofi.enable       	= true;
        godot.enable       	= false;
        blender.enable     	= true;
        nextcloud.enable   	= true;
        ghostwriter.enable 	= true;
        smart.enable       	= true;
      };
      browsers = {
        default			        = "firefox";
        firefox.enable 	    = true;
        qutebrowser.enable 	= true;
        chromium.enable 	  = true;
      };
      communication = {
        discord.enable  = true;
        element.enable  = true;
        signal.enable   = true;
        telegram.enable = true;
      };
      media = {
        graphics.enable  = true;
        video.enable     = true;
        audio.enable     = true;
        daw.enable       = false;
      };
      term = {
        default      = "kitty";
        st.enable    = true;
        kitty.enable = true;
      };
      vm = {
        qemu.enable = true;
      };
    };
    connectivity = {
      vpn.enable = true;
    };
    dev = {
      cc.enable          = true;
      clojure.enable     = false;
      common-lisp.enable = false;
      go.enable          = true;
      julia.enable		 = false;
      lua.enable         = false;
      node.enable        = false;
      python.enable      = true;
      rust.enable        = false;
      scala.enable       = false;
      shell.enable       = true;
    };
    editors = {
      default      = "micro";
      vim.enable   = true;
      micro.enable = true;
    };
    hardware = {
      audio.enable   = true;
      fs.enable      = false;
      nvidia.enable  = true;
      sensors.enable = true;
    };
    shell = {
      direnv.enable = true;
      git.enable    = true;
      gnupg.enable  = true;
      pass.enable   = true;
      tmux.enable   = false;
      zsh.enable    = true;
      cli.enable    = true;
    };
    services = {
      docker.enable 		  = true;
      gitea.enable  		  = false;
      jellyfin.enable		  = false;
      k8s.enable    		  = true;
      nginx.enable			  = false;
      ssh.enable    		  = true;
      transmission.enable	= false;
    };
    theme.active = "alucard";
  };


  ## Local config
  programs.ssh.startAgent           = true;
  services.openssh.startWhenNeeded  = true;

  networking.networkmanager.enable  = true;
  # The global useDHCP flag is deprecated, therefore explicitly set to false
  # here. Per-interface useDHCP will be mandatory in the future, so this
  # generated config replicates the default behaviour.
  networking.useDHCP                = false;
}
