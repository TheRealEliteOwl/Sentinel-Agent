<#	
	.NOTES
	===========================================================================
	 Last Update:  	7/5/2019 5:46 PM
	 Created by:   	Jonathan Green
	 Organization: 	OnlineOwls
	 Filename:     	ThreatIntelAgent.ps1
	===========================================================================
	.DESCRIPTION
		Installs the latest version of the Microsoft Monitoring Agent and installs to the customer tenancy. Requires Azure Log Analytics Workspace ID and Key.
#>

#Insert the customer specific workspace ID and key below
$wsid = "<Insert WorkSpace ID Here>"
$wskey = "<Insert WorkSpace Primary or Secondary Key>"

#Feel free to change Install Paths as needed.
$newdir = "C:\ProgramData\OnlineOwls\ThreatIntel"
mkdir $newdir
pushd $newdir
$url = "https://go.microsoft.com/fwlink/?LinkId=828603"
$output = "C:\ProgramData\OnlineOwls\ThreatIntel\Sensor.exe"
Invoke-WebRequest -URI $url -OutFile $output

Start-Process -FilePath "Sensor.exe" -Verb runas -ArgumentList "/qn", "NOAPM=1", "ADD_OPINSIGHTS_WORKSPACE=1", "OPINSIGHTS_WORKSPACE_AZURE_CLOUD_TYPE=0", "OPINSIGHTS_WORKSPACE_ID=$wsid", "OPINSIGHTS_WORKSPACE_KEY=$wskey", "AcceptEndUserLicenseAgreement=1"
