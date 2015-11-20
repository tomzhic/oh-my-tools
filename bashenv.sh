# Set bash env which shall be set in bashrc.
# But when we run bash shell script on windows cmd.exe,
# we cannot source this file to set env(like bash -i).
# So create this file to "source" for bash shell script
# which run on cmd.exe

export PATH="/cygdrive/c/windows/system32:/cygdrive/c/windows:/bin:/usr/bin:/usr/local/bin:/xbin"
export DISPLAY=:0.0
chcp.com 437 > /dev/null