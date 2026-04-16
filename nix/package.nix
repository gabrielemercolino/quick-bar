{
  perSystem =
    { pkgs, ... }:
    {
      packages.default = pkgs.stdenvNoCC.mkDerivation rec {
        pname = "quick-bar";
        version = "0.1.0";

        src = pkgs.lib.cleanSourceWith {
          src = ../.;
          filter =
            path: type:
            let
              rel = pkgs.lib.removePrefix (toString ../.) path;
            in
            !(builtins.any (prefix: pkgs.lib.hasPrefix prefix rel) [
              "/.envrc"
              "/.github"
              "/.gitignore"
              "/nix"
              "/LICENSE"
              "/README.md"
              "/flake.nix"
              "/flake.lock"
            ]);
        };

        nativeBuildInputs = with pkgs; [ qt6.wrapQtAppsHook ];
        buildInputs = with pkgs; [ qt6.qtbase ];

        installPhase = ''
          mkdir -p $out/share/ $out/bin
          cp -r . $out/share/
          ln -s ${pkgs.quickshell}/bin/qs $out/bin/${pname}
        '';

        preFixup = ''
          qtWrapperArgs+=(
            --set-default QS_CONFIG_PATH "$out/share/"
          )
        '';

        meta = {
          mainProgram = pname;
        };
      };
    };
}
