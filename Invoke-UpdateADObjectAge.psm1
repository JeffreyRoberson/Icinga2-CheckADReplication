Function Invoke-UpdateADObjectAge()
{
    Set-ADObject -Identity "CN=Nagios Test,CN=Users,DC=hutchgov,DC=com" -Description "$([DateTimeOffset]::Now.ToUnixTimeSeconds())";
    $Result = New-IcingaCheck -Name "AD Object Updated" -Value 0;
    $Result.WarnOutOfRange(1).CritOutOfRange(2) | Out-Null;

    return (New-IcingaCheckResult -Check $Result -Compile);
}
 