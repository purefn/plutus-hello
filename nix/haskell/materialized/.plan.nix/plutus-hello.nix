{ system
  , compiler
  , flags
  , pkgs
  , hsPkgs
  , pkgconfPkgs
  , errorHandler
  , config
  , ... }:
  {
    flags = { defer-plugin-errors = false; };
    package = {
      specVersion = "2.4";
      identifier = { name = "plutus-hello"; version = "0.1.0.0"; };
      license = "NONE";
      copyright = "";
      maintainer = "Your email";
      author = "Your name";
      homepage = "";
      url = "";
      synopsis = "";
      description = "";
      buildType = "Simple";
      isLocal = true;
      detailLevel = "FullDetails";
      licenseFiles = [];
      dataDir = ".";
      dataFiles = [];
      extraSrcFiles = [];
      extraTmpFiles = [];
      extraDocFiles = [];
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."plutus-contract" or (errorHandler.buildDepError "plutus-contract"))
          (hsPkgs."plutus-tx-plugin" or (errorHandler.buildDepError "plutus-tx-plugin"))
          (hsPkgs."plutus-tx" or (errorHandler.buildDepError "plutus-tx"))
          (hsPkgs."plutus-ledger" or (errorHandler.buildDepError "plutus-ledger"))
          ];
        buildable = true;
        modules = [ "Plutus/Contracts/Hello" ];
        hsSourceDirs = [ "src" ];
        };
      };
    } // rec { src = (pkgs.lib).mkDefault .././.; }