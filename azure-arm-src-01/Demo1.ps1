Set-AzureRmCurrentStorageAccount -ResourceGroupName ArmDemo -Name armdemonestedacc
$token = New-AzureStorageContainerSASToken -Name token1 -Permission r -ExpiryTime (Get-Date).AddMinutes(30.0)
$url = (Get-AzureStorageBlob -Container test -Blob Demo1ParentTemplate.json).ICloudBlob.uri.AbsoluteUri
New-AzureRmResourceGroupDeployment -ResourceGroupName armdemogroup -TemplateUri ($url + $token) -containerSasToken $token