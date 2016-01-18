@rem | killprocess [process] 
@rem | Terminates the specified process. In the [process] parameter, you can specify the full path of the process filename (e.g: 'C:\Program Files\Internet Explorer\iexplore.exe') or the name of the process only, without the path (e.g.: iexplore.exe). You can also specify the Process ID, by adding the '/' character as a prefix (e.g. /1120). 
@rem | Examples: 
@rem | killprocess iexplore.exe 
@rem | killprocess "c:\winnt\system32\calc.exe" 
@rem | killprocess /1830 

@%~dp0\nircmd.exe killprocess %*