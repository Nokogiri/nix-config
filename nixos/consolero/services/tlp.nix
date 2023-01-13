{
  services.tlp = {
    enable = true;
    settings = {
      MAX_LOST_WORK_SECS_ON_AC = "15";
      MAX_LOST_WORK_SECS_ON_BAT = "60";
      CPU_SCALING_GOVERNOR_ON_AC = "ondemand";
      CPU_SCALING_GOVERNOR_ON_BAT = "conservative";
      CPU_SCALING_MIN_FREQ_ON_AC = "400000";
      CPU_SCALING_MAX_FREQ_ON_AC = "3000000";
      CPU_SCALING_MIN_FREQ_ON_BAT = "400000";
      CPU_SCALING_MAX_FREQ_ON_BAT = "2000000";
      CPU_BOOST_ON_AC = "1";
      CPU_BOOST_ON_BAT = "0";
      SCHED_POWERSAVE_ON_AC = "0";
      SCHED_POWERSAVE_ON_BAT = "1";
      NMI_WATCHDOG = "0";
      DISK_DEVICES = "nvme0n1";
      DISK_APM_LEVEL_ON_AC = "254 254";
      DISK_APM_LEVEL_ON_BAT = "128 128";
      DISK_APM_CLASS_DENYLIST = "usb ieee1394";
      SATA_LINKPWR_ON_AC = "med_power_with_dipm max_performance";
      SATA_LINKPWR_ON_BAT = "min_power";
      AHCI_RUNTIME_PM_ON_AC = "on";
      AHCI_RUNTIME_PM_ON_BAT = "auto";
      RADEON_DPM_PERF_LEVEL_ON_AC = "auto";
      RADEON_DPM_PERF_LEVEL_ON_BAT = "auto";
      RADEON_DPM_STATE_ON_AC = "performance";
      RADEON_DPM_STATE_ON_BAT = "battery";
      WIFI_PWR_ON_AC = "on";
      WIFI_PWR_ON_BAT = "on";
      WOL_DISABLE = "Y";
      SOUND_POWER_SAVE_ON_AC = "1";
      SOUND_POWER_SAVE_ON_BAT = "1";
      SOUND_POWER_SAVE_CONTROLLER = "Y";
      PCIE_ASPM_ON_AC = "default";
      PCIE_ASPM_ON_BAT = "default";
      RUNTIME_PM_ON_AC = "on";
      RUNTIME_PM_ON_BAT = "auto";
      USB_AUTOSUSPEND = "1";
      USB_DENYLIST = "152d:0578";
      USB_EXCLUDE_AUDIO = "1";
      DEVICES_TO_ENABLE_ON_STARTUP = "wifi";
      DEVICES_TO_ENABLE_ON_AC = "bluetooth wifi";
      DEVICES_TO_DISABLE_ON_BAT_NOT_IN_USE = "bluetooth";
    };
  };
}
