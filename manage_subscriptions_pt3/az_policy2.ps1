$policydefinitions = "azurepolicyset.definitions.json"
$policysetparameters = "azurepolicyset.parameters.json"
$Subscription= Get-AZSubscription
$policyset= New-AzPolicySetDefinition -Name "skus-for-multiple-types-1" -DisplayName "Allowed SKUs for Storage Accounts and Virtual Machines" -Description "This policy allows you to speficy what skus are allowed for storage accounts and virtual machines" -PolicyDefinition $policydefinitions -Parameter $policysetparameters 
 
New-AzPolicyAssignment -PolicySetDefinition $policyset -Name DemoPolicyAssignment -Scope ("/subscriptions/" + $Subscription.Id)  -LISTOFALLOWEDSKUS_1 "Standard_B1ls,Standard_B1ms"
