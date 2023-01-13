{
  services.udev.extraRules = ''
    # Valve USB devices
    SUBSYSTEM=="usb", ATTRS{idVendor}=="28de", MODE="0666"
    # Valve HID devices over bluetooth hidraw
    KERNEL=="hidraw*", KERNELS=="*28DE:*", MODE="0666", TAG+="uaccess"
    # Sony USB devices
    SUBSYSTEM=="usb", ATTRS{idVendor}=="054c", MODE="0666"
    # Sony input devices over bluetooth
    SUBSYSTEM=="input", KERNELS=="*054C:09CC*", MODE="0666", TAG+="uaccess"
    # uinput kernel module write access (allows keyboard, mouse and gamepad emulation)
    KERNEL=="uinput", SUBSYSTEM=="misc", TAG+="uaccess", OPTIONS+="static_node=uinput", MODE="0666"
  '';
}
