{ name, config, resources, ... }:

with import ./../lib.nix;
{
  config = {

    global = {
      allocateElasticIP = true;
      enableEkgWeb      = true;
      dnsDomainname     = "aws.iohk.io";
    };

    services = {
      dd-agent.tags              = ["env:production"];

      # DEVOPS-64: disable log bursting
      journald.rateLimitBurst    = 0;
    };

  };
}
