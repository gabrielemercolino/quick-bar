{
  perSystem =
    { pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          quickshell
          python3
          qt6.qtdeclarative
        ];

        shellHook =
          #sh
          ''
            echo
            echo "qs -p $(pwd) for local testing"
            echo
          '';

        QSG_RHI_BACKEND = "vulkan"; # vulkan renderer by default
      };
    };

}
