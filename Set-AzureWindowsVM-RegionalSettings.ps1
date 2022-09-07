# Script to configure regional settings to English UK on Azure Virtual Machines
# Author: Victor Valentin

# Downdload XML file
$XMLfileURL = "https://raw.githubusercontent.com/subseven-oax/AzureVM-Personalization/main/AzureVM-GB-XMLfile.xml"
$XMLfile = "D:\AzureVM-GB-XMLfile.xml"
$webclient = New-Object System.Net.WebClient
$webclient.DownloadFile($XMLfileURL,$XMLfile)


# Set regional settings using XML file
& $env:SystemRoot\System32\control.exe "intl.cpl,,/f:`"$XMLfile`""

# Set languages
Set-WinSystemLocale en-GB
Set-WinUserLanguageList -LanguageList en-GB -Force
Set-Culture -CultureInfo en-GB
Set-WinHomeLocation -GeoId 242
Set-TimeZone -Name "GMT Standard Time"

# restart virtual machine to apply regional settings
Start-sleep -Seconds 40
Restart-Computer
