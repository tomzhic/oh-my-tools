@rem | monitor [action] 
@rem | Changes the state of the display monitor. The [action] parameter may contain the following values: 
@rem | off: Turn off the monitor 
@rem | on: Turn on the monitor 
@rem | low: Set the monitor to low power state. 
@rem | 
@rem | This command only works in systems that support this feature. If you have a problem that NirCmd remains in memory when using this command, you may try to use async_off, async_on and async_low actions instead of on/off/low actions. 
@rem | Examples: 
@rem | monitor off
@rem | monitor on
@rem | monitor async_off

@%~dp0\nircmd.exe monitor %*