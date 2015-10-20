@echo off

:BEGIN
set CYGWIN_ROOT=%~dp0\..
set SETUP=%CYGWIN_ROOT%\setup-x86_64.exe

::Command Line Options:
::
:: -D --download                     Download from internet
:: -L --local-install                Install from local directory
:: -s --site                         Download site
:: -O --only-site                    Ignore all sites except for -s
:: -R --root                         Root installation directory
:: -x --remove-packages              Specify packages to uninstall
:: -c --remove-categories            Specify categories to uninstall
:: -P --packages                     Specify packages to install
:: -C --categories                   Specify entire categories to install
:: -p --proxy                        HTTP/FTP proxy (host:port)
:: -a --arch                         architecture to install (x86_64 or x86)
:: -q --quiet-mode                   Unattended setup mode
:: -M --package-manager              Semi-attended chooser-only mode
:: -B --no-admin                     Do not check for and enforce running as
::                                   Administrator
:: -W --wait                         When elevating, wait for elevated child
::                                   process
:: -h --help                         print help
:: -i --ini-basename                 Use a different basename, e.g. "foo",
::                                   instead of "setup"
:: -v --verbose                      Verbose output
:: -l --local-package-dir            Local package directory
:: -r --no-replaceonreboot           Disable replacing in-use files on next
::                                   reboot.
:: -X --no-verify                    Don't verify setup.ini signatures
:: -I --include-source               Automatically include source download
:: -n --no-shortcuts                 Disable creation of desktop and start menu
::                                   shortcuts
:: -N --no-startmenu                 Disable creation of start menu shortcut
:: -d --no-desktop                   Disable creation of desktop shortcut
:: -K --pubkey                       URL of extra public key file (gpg format)
:: -S --sexpr-pubkey                 Extra public key in s-expr format
:: -u --untrusted-keys               Use untrusted keys from last-extrakeys
:: -U --keep-untrusted-keys          Use untrusted keys and retain all
:: -g --upgrade-also                 also upgrade installed packages
:: -o --delete-orphans               remove orphaned packages
:: -Y --prune-install                prune the installation to only the requested
::                                   packages
:: -m --mirror-mode                  Skip availability check when installing from
::                                   local directory (requires local directory to
::                                   be clean mirror!)
:: -A --disable-buggy-antivirus      Disable known or suspected buggy anti virus
::                                   software packages during execution.


%SETUP% %*