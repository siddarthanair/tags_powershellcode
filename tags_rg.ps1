# to apply tags to all the resources in the RG
$resourcegroupname="resourcegroupname"
$myresources = Get-AzResource -ResourceGroupName $resourcegroupname
foreach ($oneres in $myresources)
{
$resourceId=$oneres.ResourceId
$tags = @{"Dept"="Finance";"Status"="update"}
update-AzTag -ResourceId $resourceId -Tag $tags -Operation Merge
}



#  fetch the resources which have specific tag and update the tags to those specific resources
$resourcegroupname="resourcegroupname"
$myresources = Get-AzResource -ResourceGroupName $resourcegroupname -TagName created_by
foreach ($oneres in $myresources)
{
$resourceId=$oneres.ResourceId
$tags = @{"Dept"="Finance";"Status"="update"}
update-AzTag -ResourceId $resourceId -Tag $tags -Operation Merge
}


# fetch resources with No tags and update the tags to those resources. 


$resourceGroupName = "resourcegroupname"

$myresources=Get-AzResource -ResourceGroupName $resourcegroupname `
    | Where-Object {$null -eq $_.Tags -or $_.Tags.Count -eq 0} `
    | Format-Table -AutoSize

foreach ($oneres in $myresources)
{
write-output $myresources
$resourceId=$oneres.ResourceId
$tags = @{"Dept"="Finance";"Status"="update2"}
update-AzTag -ResourceId $resourceId -Tag $tags -Operation Merge
}





