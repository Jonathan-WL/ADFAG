# Setting the default execution policy for the current powershell session
# Enter in Powershell console window before executing the script
# Get-ExecutionPolicy
# Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
$Start = (Get-Date)

#Write-host "Script Started"
Write-Host -Fore White "-------------------------------------------------------------------"
Write-Host -Fore Green "     AUTOMATED DIGITAL FORENSIC ARTEFACT GATHERING v1.0" 
Write-Host -Fore Green "                  (c) 2021 jonnalw97@gmail.com" 
Write-Host -Fore White "-------------------------------------------------------------------"
Start-Sleep -Seconds 3

#####################
#    Case Info      #
#####################
# The user will need to enter information for the audit log. The current input for file location is somewhat unreliable due to potential typos.
$Drive_Letter_Tools = Read-Host "Select drive letter for storage media with tools(example 'D:')"
$Drive_Letter = Read-Host "Select drive letter or path for storing artefacts(example 'D:')"  
$Case_Number = Read-Host "Input case number"
$Evidence_Number = Read-Host "Input evidence number"
$Unique_Description = Read-Host "Input a unique description"
$Examiner = Read-Host "Input the examiner"
$Notes = Read-Host "Input any notes"
$Date = Get-Date
$Time = Get-TimeZone

# Creates directory for storing Evidence Directories
Write-Host ""
Write-Host "Creating directory for the current case"
$path = "$Drive_Letter\Case_$Case_Number"
# Checks if the path exist. If it exist, a creation is not attempted
# If it is non-existent, the folder is created
if(!(test-path $path))
{
      New-Item -Path $Drive_Letter -Name "Case_$Case_Number" -ItemType "directory"
}
# Allows user to have time to see what has happened
Start-Sleep -Seconds 2

# Creates directory for storing Artefacts and subdirectories for artefacts
Write-Host ""
Write-Host "Creating directory for the current evidence"
$path = "$Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number"
# Checks if the path exist. If it exist, a creation is not attempted
# If it is non-existent, the folder is created
if(!(test-path $path))
{
      New-Item -Path "$Drive_Letter\Case_$Case_Number" -Name "Evidence_$Evidence_Number" -ItemType "directory"
}
# Allows user to have time to see what has happened
Start-Sleep -Seconds 2
# Adding users input to the audit log
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "AUTOMATED DIGITAL FORENSIC ARTEFACT GATHERING" 
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Case Number: $Case_Number"
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Evidence Number: $Evidence_Number"
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Unique Description: $Unique_Description"
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Examiner: $Examiner"
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Notes: $Notes"
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Location for storing artefacts: $Drive_Letter"
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date: $Date & TimeZone: $Time"
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""

# Adding created directory information to audit log
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "'Case_$Case_Number' directory created for showing case number"
$Date = Get-Date
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time of creation: $Date"

# Adding created directory information to audit log
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "'Evidence_$Evidence_Number' directory created for showing evidence number"
$Date = Get-Date
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time of creation: $Date"

##########################
#        Artefacts       #
##########################

# Creates directory for storing artefacts collected with basic Powershell cmdlets
Write-Host ""
Write-Host "Creating directory for storing basic artefacts"
$path = "$Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Artefacts"
# Checks if the path exist. If it exist, a creation is not attempted
# If it is non-existent, the folder is created
if(!(test-path $path))
{
       New-Item -Path "$Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number" -Name "Artefacts" -ItemType "directory"
}
# Allows user to have time to see what has happened
Start-Sleep -Seconds 2
# Adding created directory information to audit log
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "'Artefacts' directory created for storing artefacts collected with basic Powershell cmdlets" 
$Date = Get-Date
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time of creation: $Date"

# 1 | Cmdlet for gathering Machine and OS information
Write-Host ""
Write-Host "Collecting Machine and OS information"
Get-ComputerInfo | Out-File $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Artefacts\ComputerInfo.txt
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Machine and OS information have been gathered and is stored under: 
- $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Artefacts\ComputerInfo.txt"
$Date = Get-Date
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time for collection: $Date"

# 2 | Gathers all event logs on the local computer
Write-Host ""
Write-Host "Collecting all event logs on the local computer"
Get-WinEvent -ListLog * | Sort-Object RecordCount -Descending | ConvertTo-Csv | Out-File $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Artefacts\EventsSorted.csv
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "All event logs on the local machine has been sorted by counts and gathered under: 
- $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Artefacts\EventsSorted.csv"
$Date = Get-Date
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time for collection: $Date"

# 3 | Gathers all successful login events, which is too much information to read.
Write-Host ""
Write-Host "Collecting all successful login events"
Get-EventLog -LogName Security -InstanceId 4624 | ForEach-Object {
     <#
      Uses a for loop to gather specific objects
      The "Date and Time" expression gathers the string from TimeGenerated
      The "Account Name\Domain" expression gathers the strings in AccountName and AccountDomain from New Logon
      The "Account Name\Domain" expression gathers the strings in AccountName and AccountDomain from New Logon
      The "Authentication Package" expression gathers the string in Authentication Package from Detailed Authentication Information
      The "Path" expression gathers the string 
     #>                                        
    [PSCustomObject]@{
        "Date and Time" = $_.TimeGenerated
        "Logon Type" = $_.ReplacementStrings[8]
        "Authentication Package" = $_.ReplacementStrings[10]
        "Process Name" = $_.ReplacementStrings[17]
        "Domain Name" = $_.ReplacementStrings[6]
        "Account Name" = $_.ReplacementStrings[5]
    }
} | Format-Table -AutoSize | ConvertTo-Csv | Out-File $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Artefacts\SuccessfulLogonsFiltered.csv
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and Time, Account Name, Domain Name, Logon Type, Authentication Package and Process Name from successful logons(Event ID 4624) have been gathered under: 
- $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\SuccessfulLogonsFiltered.csv"
$Date = Get-Date
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time for collection: $Date"

# 4 | Gathers all updates/hotfixes installed on the local computer
Write-Host ""
Write-Host "Collecting all hotfixes installed on the system"
Get-HotFix | Format-Table -AutoSize | ConvertTo-Csv | Out-File $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Artefacts\Updates.csv
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "All Updates and Hotfixes have been gathered under: 
- $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Updates.csv"
$Date = Get-Date
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time for collection: $Date"

# 5 | Gathers information about firewall rules
Write-Host ""
Write-Host "Collecting information about firewall rules"
Get-NetFirewallRule | Select-Object Name,DisplayName,Direction,Enabled | Sort Enabled,@{Expression="DisplayName";Ascending=$true} | ConvertTo-Csv | Out-File $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Artefacts\FirewallRule.csv
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "All Updates and Hotfixes have been gathered under: 
- $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Updates.csv"
$Date = Get-Date
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time for collection: $Date"

#########################
#          CIM          #
#########################
Write-Host ""
Write-Host "Creating directory for storing CIM artefacts"
# Creates directory for storing CIM artefacts
$path = "$Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\CIMArtefacts"
# Checks if the path exist. If it exist, a creation is not attempted
# If it is non-existent, the folder is created
if(!(test-path $path))
{
       New-Item -Path "$Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number" -Name "CIMArtefacts" -ItemType "directory"
}
# Allows user to have time to see what has happened
Start-Sleep -Seconds 2
# Adding created directory information to audit log
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "'CIMArtefacts' directory created for storing artefacts collected with CIM"
$Date = Get-Date
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time of creation: $Date"

# 1 | Uses CIM to gather information about user accounts
Write-Host ""
Write-Host "Collecting user profiles"
Get-CimInstance -Class Win32_UserProfile | Select-Object -Property LocalPath,LastUseTime | Sort-Object | ConvertTo-Csv | Out-File $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\CIMArtefacts\UserProfiles.csv                                           
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "The properties LocalPath and LastUseTime have been gathered from user profiles and is stored under 
- $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\CIMArtefacts\UserProfiles.csv"
$Date = Get-Date
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time for collection: $Date"

# 2 | Uses CIM to gather information about user accounts
Write-Host ""
Write-Host "Collecting user accounts"
Get-CimInstance -Class Win32_UserAccount | Select-Object -Property AccountType,Caption,Name,SID | Sort-Object | ConvertTo-Csv | Out-File $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\CIMArtefacts\UserAccounts.csv
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "The properties AccountType, Caption, Name and SID have been gathered from user accounts and is stored under: 
- $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\CIMArtefacts\UserAccounts.csv "
$Date = Get-Date
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time for collection: $Date"

# 3 | Uses CIM to gather the processname, process ID, and the path to the processses that have these values present
Write-Host ""
Write-Host "Collecting running processes"
Get-CimInstance -Class Win32_Process | Sort-Object ProcessName | ConvertTo-Csv | Out-File $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\CIMArtefacts\RunningProcesses.csv
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Running processes have been gathered and is stored under: 
- $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\CIMArtefacts\RunningProcesses.csv"
$Date = Get-Date
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time for collection: $Date"

# 4 | Uses CIM to gather commands that automatically runs after logon and the location of the belonging application 
Write-Host ""
Write-Host "Collecting startup locations"
Get-CimInstance -Class Win32_StartupCommand | Sort-Object Caption | ConvertTo-Csv | Out-File $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\CIMArtefacts\StartupInfo.csv
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Startup commands have been gathered and is stored under:
- $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\CIMArtefacts\StartupInfo.csv'"
$Date = Get-Date
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time for collection: $Date"

# 5 | Uses CIM to gather Network Configurations and specifically DHCPEnabled, ServiceName, Description and Index
Write-Host ""
Write-Host "Collecting Network Configurations"
Get-CimInstance -Class Win32_NetworkAdapterConfiguration | Select-Object -Property DHCPEnabled,ServiceName,Description,Index | ConvertTo-Csv | Out-File $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\CIMArtefacts\NetworkConfiguration.csv
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "The properties DHCPEnabled, ServiceName, Description and Index have been gathered from Network Adapter Configurations and is stored under: 
- $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\CIMArtefacts\NetworkConfiguration.csv"
$Date = Get-Date
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time for collection: $Date"

# 6 | Uses CIM to gather created Shadowcopies and the time of creation
Write-Host ""
Write-Host "Collecting Shadow Copies"
Get-CimInstance -Class Win32_ShadowCopy | Select-Object DeviceObject,InstallDate | ConvertTo-Csv | Out-File $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\CIMArtefacts\ShadowCopies.csv
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "The properties DeviceObject and InstallDate have been gathered from Shadowcopies under:
- $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\CIMArtefacts\ShadowCopies.csv"
$Date = Get-Date
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time for collection: $Date"

#################################
#      Registry Information     #
#################################
Write-Host ""
Write-Host "Creating directory for storing Registry artefacts"

$path = "$Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\RegistryArtefacts"
# Checks if the path exist. If it exist, a creation is not attempted
# If it is non-existent, the folder is created
if(!(test-path $path))
{
      New-Item -Path "$Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number" -Name "RegistryArtefacts" -ItemType "directory"
}
# Allows user to have time to see what has happened
Start-Sleep -Seconds 2
# Adding created directory information to audit log
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "'RegistryArtefacts' directory created for storing registry artefacts"
$Date = Get-Date
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time of creation: $Date"


Write-Host ""
Write-Host "Collecting information about startup applications"
# 1 | Gathers information about startup applications for 64 bit operating systems
Get-ItemProperty -Path HKLM:\SOFTWARE\wow6432node\Microsoft\Windows\CurrentVersion\run | Out-File $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\RegistryArtefacts\RegStartup64bit.txt
# 2 | Gathers information about startup applications for the machine
Get-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\run | Out-File $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\RegistryArtefacts\RegStartupHKLM.txt
# 3 | Gathers information about startup applications for the current user
Get-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\run | Out-File $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\RegistryArtefacts\RegStartupHKCU.txt

Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Startup application information stored in Registry have been gathered from 64 bit operating systems, the local machine and the current user and has been gathered under: 
- $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\RegistryArtefacts\RegStartup64bit.txt
- $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\RegistryArtefacts\RegStartupHKLM.txt
- $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\RegistryArtefacts\RegStartupHKCU.txt"
$Date = Get-Date
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time for collection: $Date"


Write-Host ""
Write-Host "Collecting information about installed applications"
# 4 | Gathers installed applications, removes blank fields
Get-ItemProperty -Path HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object -Property DisplayName, Publisher, InstallDate, EstimatedSize | Sort-Object DisplayName | Where-Object{($_.DisplayName)} | ConvertTo-Csv | Out-File $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\RegistryArtefacts\InstalledApplications.csv
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "The properties DisplayName, Publisher, InstallDate, EstimatedSize have been filtered for Installed applications information stored in Registry, and it has been gathered under: 
- $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\RegistryArtefacts\InstalledApplications.csv"
$Date = Get-Date
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time for collection: $Date"


Write-Host ""
Write-Host "Collecting information about mapped drives, USB devices and removable hard drives"
# 5 | Gathers information about mapped drives, USB devices and removable hard drives. Further research needed
Get-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2 | Out-File $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\RegistryArtefacts\MountPoints.txt
# Every child item under MountPoints2 is gathered for more details
Get-ChildItem  -Recurse "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2" | Format-Table -AutoSize | Out-File $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\RegistryArtefacts\RegMountChildItems.txt
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Mapped drives, USB devices, child items and removable hard drive information stored in registry have been gathered and is stored under: 
- $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\RegistryArtefacts\RegStartup64bit.txt"
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time for collection: $Date"


Write-Host ""
Write-Host "Collecting information about USB Storage devices"
# 6 | Gathers USB storage devices. Both previous and current
Get-ItemProperty -Path HKLM:\SYSTEM\currentcontrolset\enum\usbstor\*\* | Select-Object -Property FriendlyName | Sort-Object | ConvertTo-Csv | Out-File $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\RegistryArtefacts\USBdevices.csv
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "The property FriendlyName have been filtered for USB storage devices information stored in Registry, and it has been gathered under: 
- $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\RegistryArtefacts\USBdevices.csv"
$Date = Get-Date
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time for collection: $Date"


Write-Host ""
Write-Host "Collecting information about Internet settings for the current user"
# 7 | Gathers Internet settings for the current user
Get-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\' | Out-File $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\RegistryArtefacts\InternetSettings.txt
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Internet Settings information stored in Registry has been gathered under: 
- $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\RegistryArtefacts\InternetSettings.txt"
$Date = Get-Date
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time for collection: $Date"


Write-Host ""
Write-Host "Collecting information about URLs typed in Internet Explorer"
# 8 | Gathers typed URLs in Internet Explorer. Might prove very unreliable depending on the used browser
Get-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Internet Explorer\TypedUrls' | Out-File $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\RegistryArtefacts\TypedUrlsIE.txt
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Typed Urls from Internet Explorer stored in Registry has been gathered under: 
- $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\RegistryArtefacts\TypedUrlsIE.txt"
$Date = Get-Date
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time for collection: $Date"


Write-Host ""
Write-Host "Collecting information about all profiles on the machine"
# 9 | Gathers all profiles on the local machine
Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\*' | Select-Object -Property ProfileImagePath | Sort-Object | ConvertTo-Csv | Out-File $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\RegistryArtefacts\ProfilesRegistry.csv
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Profiles on the machine stored in Registry has been gathered under: 
- $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\RegistryArtefacts\ProfilesRegistry.csv"
$Date = Get-Date
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time for collection: $Date"

##################################
#              KAPE              #
##################################
# Function for executing Kape modules. Is placed before the interation loop with the user due to PowerShell processing from top-bottom
# Having the do loop above will result in the script not locating the function, as it then has not been processed yet

function kape_artefacts
{
 
 <#
 For every Kape module, cmd has been run as adminstrator and the storage destination for artefacts is a folder created by the script on the storage media
 cmd window is minised for visual reasons, and further actions is set to wait until process is done
 #>
 Write-Host ""
 Write-Host "Creating directory for storing Kape artefacts"
 # Creates directory for storing artefacts from KAPE
 $path = "$Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\KAPEArtefacts"
 # Checks if the path exist. If it exist, a creation is not attempted
 # If it is non-existent, the folder is created
 if(!(test-path $path))
 {
       New-Item -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number -Name "KAPEArtefacts" -ItemType "directory"
 }
 # Allows user to have time to see what has happened
 Start-Sleep -Seconds 2
 # Adding created directory information to audit log
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "'KAPEArtefacts' directory created for storing Kape artefacts"
 $Date = Get-Date
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time of creation: $Date"


 Write-Host ""
 Write-Host "Collecting detailed information about the System"
 # 1 | Using the NetSystemInfo module to gather information about user accounts, aliases, password and lock configurations, shared resources and started windows-services.
 Start-Process -FilePath "C:\Windows\System32\cmd.exe" -verb runas -ArgumentList /c,$Drive_Letter_Tools\KAPE\kape.exe,--msource,C:,--mdest,$Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\KAPEArtefacts,--module,NetSystemInfo -WindowStyle Minimized -wait
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "The artefacts from the NetSystemInfo module is stored in the file: 
 - $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\KAPEArtefacts\LiveResponse\NetSystemInfo.txt"
 $Date = Get-Date
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time for collection: $Date"
 

 Write-Host ""
 Write-Host "Collecting information about Network Details"
 # 2 | Using the NetworkDetails module to gather details about Network. Out files contain ARP cache, DNS cache, IP configuration, NetBIOS cache, NetBIOS sessions, network connections, and routing table.
 Start-Process -FilePath "C:\Windows\System32\cmd.exe" -verb runas -ArgumentList /c,$Drive_Letter_Tools\KAPE\kape.exe,--msource,C:,--mdest,$Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\KAPEArtefacts,--module,NetworkDetails -WindowStyle Minimized -wait
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "The artefacts from the NetworkDetails module is stored in several files: 
 - $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\KAPEArtefacts\LiveResponse\arp_cache.txt
 - $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\KAPEArtefacts\LiveResponse\dns_cache.txt
 - $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\KAPEArtefacts\LiveResponse\ipconfig.txt
 - $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\KAPEArtefacts\LiveResponse\netbios_cache.txt
 - $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\KAPEArtefacts\LiveResponse\netbios_sessions.txt
 - $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\KAPEArtefacts\LiveResponse\network_connections.txt
 - $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\KAPEArtefacts\LiveResponse\routing_table.txt"
 $Date = Get-Date
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time for collection: $Date"
 

 Write-Host ""
 Write-Host "Collecting information about Running Processes"
 # 3 | Using the ProcessDetails module to gather information about running processes.
 Start-Process -FilePath "C:\Windows\System32\cmd.exe" -verb runas -ArgumentList /c,$Drive_Letter_Tools\KAPE\kape.exe,--msource,C:,--mdest,$Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\KAPEArtefacts,--module,ProcessDetails -WindowStyle Minimized -wait
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "The artefacts from the ProcessDetails module is stored under the path: 
 - $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\KAPEArtefacts\LiveResponse\PWSH-Get-ProcessList.csv"
 $Date = Get-Date
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time for collection: $Date"
 

 Write-Host ""
 Write-Host "Collecting information about Program Execution"
 # 4 | Using the ProgramExecution module to gather information about executed programs.
 Start-Process -FilePath "C:\Windows\System32\cmd.exe" -verb runas -ArgumentList /c,$Drive_Letter_Tools\KAPE\kape.exe,--msource,C:,--mdest,$Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\KAPEArtefacts,--module,ProgramExecution -WindowStyle Minimized -wait
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "The artefacts from the ProgramExecution module is stored in the file: 
 - $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\KAPEArtefacts\ProgramExecution\*_Windows10Creators_SYSTEM_AppCompatCache.csv"
 $Date = Get-Date
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time for collection: $Date"
 

 Write-Host ""
 Write-Host "Collecting basic information about System"
 # 5 | Using the SystemInfo module to gather information about the system.
 Start-Process -FilePath "C:\Windows\System32\cmd.exe" -verb runas -ArgumentList /c,$Drive_Letter_Tools\KAPE\kape.exe,--msource,C:,--mdest,$Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\KAPEArtefacts,--module,SystemInfo -WindowStyle Minimized -wait
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "The artefacts from the SystemInfo module is stored under the path: 
 - $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\KAPEArtefacts\LiveResponse\SystemInfo.csv"
 $Date = Get-Date
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time for collection: $Date"

 # Merging all console log files to one collective file for easier viewing. An empty line is added at the end of each file to clearly spot where a file begins and ends in the merged file
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\KAPEArtefacts\*ConsoleLog.txt -Value ""
Get-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\KAPEArtefacts\*ConsoleLog.txt | Set-Content $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\KAPEArtefacts\ConsoleLogCollected.txt
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "All console logs generated by KAPE has been merged and can be found under: 
- $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\KAPEArtefacts\ConsoleLogCollected.txt"
$Date = Get-Date
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time for merging: $Date"
# To maintain integrity of the console log, it is hashed after merging, This file is then stored with the console log.
Get-FileHash -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\KAPEArtefacts\ConsoleLogCollected.txt | Format-List | Out-File $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\KAPEArtefacts\ConsoleLogCollectedHash.txt
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "The ConsoleLogCollected has been hashed with SHA256 and the file with the hash can be found under: 
- $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\KAPEArtefacts\ConsoleLogCollectedHash.txt"
$Date = Get-Date
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time for hashing: $Date"
}

#***********************************************************************************#

<#
 Give option to collect Artefacts with KAPE
 Function is before the do loop as PowerShell processes in order, and if the function was below, then PowerShell would not find the function. 
#>
$KAPE_collect = Read-Host "Do you wish to collect artefacts with KAPE(k) or skip the artefact collection(s)"
#Implemtent do for next step in script. either k or s can be chosen
 do {
  #if k is entered, collect artefacts
  if ($KAPE_collect -eq "k") {
   # Jump to KAPE function
   Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
   Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
   Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Option 'k' was selected, which runs the function kape_artefacts for artefact gathering with Kape"
   $Date = Get-Date
   Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time of selecting Kape artefact collection: $Date" 
   Write-Host ""
   Write-Host "Collection phase with KAPE initialised"
   kape_artefacts
  # breaking is necessary to prevent infinite loop
  break}
  # if s is entered, do not collect kape artefacts
  elseif ($KAPE_collect -eq "s") {
  Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
  Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
  Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Option 's' was selected, which skips the KAPE artefact gathering"
  $Date = Get-Date
  Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time skipped: $Date"    
  break}
  # else function to keep asking for correct input
  else {
  $KAPE_collect = Read-Host "You must enter k or s"
  }
}
# The while loop is there in case the user gives a wrong input
while ($KAPE_collect -ne "k" -or $KAPE_collect -ne "s")
 
 
#***********************************************************************************#

#####################
#      WinPmem      #
#####################

# Function for executing WinPmem
# Function is before the do loop as PowerShell processes in order, and if the function was below, then PowerShell would not find the function.
function memory_image 
{
 Write-Host ""
 Write-Host "Creating directory for storing Memory Image"
 # Creates directory for storing Memory Image
 $path = "$Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\MemoryImage"
 # Checks if the path exist. If it exist, a creation is not attempted
 # If it is non-existent, the folder is created
 if(!(test-path $path))
 {
       New-Item -Path "$Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number" -Name "MemoryImage" -ItemType "directory"
 }
 # Allows user to have time to see what has happened
 Start-Sleep -Seconds 2
 # Adding created directory information to audit log
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "'MemoryImage' directory created for storing Memory Image"
 $WinPmemStart = Get-Date
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time of creation: $Date"

 Write-Host ""
 Write-Host "Taking a Memory Dump. This takes a while. DO NOT ABORT"
 # Storing date and time at start of memory capture
 $Date = Get-Date
 Start-Process -FilePath "C:\Windows\System32\cmd.exe" -verb runas -ArgumentList /c,$Drive_Letter_Tools\winpmem_mini_x64_rc2.exe,$Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\MemoryImage\WinPmemraw.raw -WindowStyle Minimized -wait

 Write-Host ""
 Write-Host "Memory image process completed"
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Memory image has been taken of target computer with WinPmem and is stored under: 
 - $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\MemoryImage\WinPmemraw.raw"
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time for WinPmem execution: $WinPmemStart"
 $Date = Get-Date 
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time for collection: $Date  |  Total image time$($Date - $WinPmemStart)"
 Write-Host ""
 Write-Host "Creating SHA256 of memory image"
 Get-FileHash -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\MemoryImage\WinPmemraw.raw | Format-List | Out-File $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\MemoryImage\MemoryImageHash.txt
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "SHA256 Hash has been created of WinPmemraw. The hash value of WinPmemraw is stored under: 
 - $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\MemoryImage\MemoryImageHash.txt"
 $Date = Get-Date
 Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time for hashing: $Date"
}

#***********************************************************************************#


<#
 Give option to collect RAM
 Function is before the do loop as PowerShell processes in order, and if the function was below, then PowerShell would not find the function. 
#>
$collect_memory = Read-Host "Do you wish to collect volatile memory with WinPmem(w) or skip the volatile memory collection(s)"
# Implement do for next step in script. Either w or s can be chosen
 do {
  # if w is entered, collect memory
  if ($collect_memory -eq "w") {
   # Jump to memory image function
   Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
   Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
   Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Option 'w' was selected, which runs the WinPmem memory imager function"
   $Date = Get-Date
   Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time for selecting memory image option: $Date" 
   memory_image
  # Breaking is necessary to prevent infinite loop
  break}
  # if s is entered, do not collect memory
  elseif ($collect_memory -eq "s") {
  Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
  Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
  Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Option 's' was selected, which skips the WinPmem memory imager function"
  $Date = Get-Date
  Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Date and time skipped: $Date"     
  break}
  # else function to keep asking for correct input
  else {
  $collect_memory = Read-Host "You must enter w or s"
  }
 }
# The while loop is there in case the user gives a wrong input
while ($collect_memory -ne "w" -or $collect_memory -ne "s")


#***********************************************************************************#



<#
 Date is gathered at the end of script. The start time is then subtracted from this time to get the total time the script was running
 This is then added to the audit log.  
#>
$End = (Get-Date)
Write-Host "Script finished in $($End - $Start)."
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value ""
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "------------------------"
Add-Content -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' -Value "Script total time: $($End - $Start)"
# To maintain integrity of the audit log it is hashed after everything is complete. This file is then stored in the same folder as the audit log.
Get-FileHash -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\Auditlog_Case$Case_Number'_Evidence'$Evidence_Number'.txt' | Format-List | Out-File $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number\AuditLogHash.txt 

# Function for zipping case directory
function zip_directory
{
 # ZIP evidence folder
 $Zip_Location = Read-Host "Select drive letter or path for Zip location(example 'D:')"
 Compress-Archive -Path $Drive_Letter\Case_$Case_Number\Evidence_$Evidence_Number -DestinationPath $Zip_Location\Case_$Case_Number\Evidence_$Evidence_Number.zip
 # Get-FileHash of ZIP
 Get-FileHash -Path $Zip_Location\Case_$Case_Number\Evidence_$Evidence_Number.zip | Format-List | Out-File $Zip_Location\Case_$Case_Number\Evidence_$Evidence_Number.txt 
}


#***********************************************************************************#

<#
 Give option to Zip case directory
 Function is before the do loop as PowerShell processes in order, and if the function was below, then PowerShell would not find the function. 
#>
$zip_directory = Read-Host "Do you wish to zip the case diectory(z) or skip the case directory zipping(s)"
Write-Host "Verify that the Case_$Case_Number\Evidence_$Evidence_Number directory is less than 2 GB before attempting zipping"
# Implement do for final step in script. Either z or s can be chosen
 do {
  # if z is entered, zip directory
  if ($zip_directory -eq "z"){
   # Jump to memory image function
   zip_directory
  # breaking is necessary to prevent infinite loop
  break}
  # if s is entered, do not zip directory
  elseif ($zip_directory -eq "s") {
  break}
  # else function to keep asking for correct input
  else {
  $zip_directory = Read-Host "You must enter z or s"
  }
 }
# The while loop is there in case the user gives a wrong input
while ($zip_directory -ne "z" -or $zip_directory -ne "s")


#***********************************************************************************#