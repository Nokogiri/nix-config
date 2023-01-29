{
  security.polkit.enable = false;
  security.polkit.extraConfig = ''
    /* Log authorization checks. */
    polkit.addRule(function(action, subject) {
      // Make sure to set { security.polkit.debug = true; } in configuration.nix
      polkit.log("user " +  subject.user + " is attempting action " + action.id + " from PID " + subject.pid);
    });
    
    /*
     * Allow users in privileged gamemode group to run cpugovctl &
     * gpuclockctl without authentication
     */
    polkit.addRule(function (action, subject) {
        if ((action.id == "com.feralinteractive.GameMode.governor-helper" ||
             action.id == "com.feralinteractive.GameMode.gpu-helper")) /* && */
            /* subject.isInGroup("wheel")) */
        {
            return "yes";
        }
    });

    /* Allow any local user to do anything (dangerous!). */
    /*    polkit.addRule(function(action, subject) {
    *    if (subject.local) return "yes";
    *});
    */
  '';
  security.polkit.adminIdentities = [
    "unix-group:wheel"
    "unix-user:nokogiri"
  ];
}
