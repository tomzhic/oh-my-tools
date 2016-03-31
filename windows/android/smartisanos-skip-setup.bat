@echo off

adb root
adb wait-for-device
adb shell am start -n com.smartisanos.setupwizard/com.smartisanos.setupwizard.SetupWizardCompleteActivity
