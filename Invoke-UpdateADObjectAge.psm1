Function Invoke-UpdateADObjectAge()
{
    Set-ADObject -Identity "CN=TestObject,CN=Users,DC=contoso,DC=com" -Description "$([DateTimeOffset]::Now.ToUnixTimeSeconds())";
    $Result = New-IcingaCheck -Name "AD Object Updated" -Value 0;
    $Result.WarnOutOfRange(1).CritOutOfRange(2) | Out-Null;

    return (New-IcingaCheckResult -Check $Result -Compile);
}
 
