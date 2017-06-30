$Domain = $env:USERDNSDOMAIN -split "\." # or other domain

$Searcher = [ADSISearcher]"(&(objectclass=group)(cn=psconfig))"  
$Searcher.SearchRoot = "LDAP://DC=$($Domain[0]),DC=$($Domain[1])"
$Searcher.PropertiesToLoad.Add("info") | Out-Null
$psconfig_path = ($Searcher.FindAll().properties.info -split "\n")[0].trim()