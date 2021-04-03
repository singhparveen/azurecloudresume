<#
Deploy ARM Template using PowerShell Az Deployment
#>

# Define variable for the resource group name and location
$ResourceGroupName = Read-Host -Prompt "Enter a resource group name"
$Location = Read-Host -Prompt "Enter the location"

# check if the resource group already exist, use silentcontinue to avoid err output 
Get-AzResourceGroup -Name $ResourceGroupName -ErrorAction SilentlyContinue
# If exist, don't create a new otherwise create the resource group
if ($?) {
    Write-Host "Resource Group already Exist."
}
else {
    New-AzResourceGroup -Name $ResourceGroupName -Location $Location
}


$ResourceGroupName = "ps-cloudresume-rg"
# trigger the deployment in the resource group name provided earlier
New-AzResourceGroupDeployment -ResourceGroupname $ResourceGroupName -TemplateFile .\resources.json -TemplateParameterFile .\resources.parameters.json