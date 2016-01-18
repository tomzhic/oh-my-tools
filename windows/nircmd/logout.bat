@rem | exitwin [shutdown type] {additional option} 
@rem | This command terminates the current session of Windows. The [shutdown type] parameter can be one of the following values: 
@rem | logoff: Shut down all running processes, log off the current user, and display the log on dialog to allow another user to log into the system. 
@rem | reboot: Shut down the entire system, and then reboot. 
@rem | poweroff: Shut down the entire system, and then turn off the power. (Only for systems that support this feature !) 
@rem | shutdown: Simply shut down the entire system, without reboot and without turning the power off. 
@rem | You can also use one of the following additional options: 
@rem | force: Forces all applications to terminate immediately. Using this option can caused the current running application to lose data. Use it only in extreme cases ! 
@rem | forceifhung: Forces applications to terminate if they are not responding. This option is only available in Windows 2000/XP. 
@rem | 
@rem | Examples: 
@rem | exitwin reboot
@rem | exitwin poweroff force
@rem | exitwin logoff forceifhung

@%~dp0\nircmd.exe exitwin logoff %*