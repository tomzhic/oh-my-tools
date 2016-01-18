@rem | shortcut [filename] [folder] [shortcut title] {arguments} {icon file} {icon resource number} {ShowCmd} {Start In Folder} {Hot Key} 
@rem | Creates a shortcut to a file. 
@rem | The parameters: 
@rem | [filename]: Create a shortcut to this filename. 
@rem | [folder]: Specify the destination folder that inside it the shortcut will be created. You can specify any valid folder, including the special variables that represent system folders, like ~$folder.desktop$ (Desktop folder), ~$folder.programs$ (Start-Menu-Programs folder), and so on... 
@rem | [shortcut title]: The text displayed in the shortcut. 
@rem | {arguments}: Optional parameter - Additional arguments to execute the filename. 
@rem | {icon file}: Optional parameter - Use this parameter if your want that the shortcut will be displayed with icon other than the default one. 
@rem | {icon resource number}: Optional parameter - The resource number inside the icon file. 
@rem | {ShowCmd}: Optional parameter - Use this parameter if you want to maximize or minimize the window of the program. Specify "max" to maximize the window or "min" to minimize it. 
@rem | {Start In Folder}: Optional parameter - Specifies the "Start In" folder. If you don't specify this parameter, the "Start In" folder is automatically filled with the folder of the program you specify in [filename] parameter. 
@rem | {Hot Key}: Optional parameter - Specifies an hot-key that will activate the shortcut. For example: Alt+Ctrl+A, Alt+Shift+F8, Alt+Ctrl+Shift+Y 
@rem | 
@rem | Examples: 
@rem | shortcut "f:\winnt\system32\calc.exe" "~$folder.desktop$" "Windows Calculator" 
@rem | shortcut "f:\winnt\system32\calc.exe" "~$folder.programs$\Calculators" "Windows Calculator" 
@rem | shortcut "f:\Program Files\KaZaA\Kazaa.exe" "c:\temp\MyShortcuts" "Kazaa" 
@rem | shortcut "f:\Program Files" "c:\temp\MyShortcuts" "Program Files Folder" "" "f:\winnt\system32\shell32.dll" 45 
@rem | shortcut "f:\Program Files" "c:\temp\MyShortcuts" "Program Files Folder" "" "" "" "max" 

@%~dp0\nircmd.exe shortcut %*