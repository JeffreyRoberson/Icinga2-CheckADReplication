
function Invoke-CheckADObjectAge ()
{
  param(
    $Warning = $null,
    $Critical = $null,
    [switch]$NoPerfData = $FALSE,
    [ValidateSet(0,1,2)]
    $Verbosity = 0
  );
  $TestUser = Get-ADObject -Identity "CN=TestObject,CN=Users,DC=contoso,DC=com" -Properties Description;
  $Stamp = $TestUser.Description;
  $Age = [DateTimeOffset]::Now.ToUnixTimeSeconds() - $Stamp;

  $result = New-IcingaCheck -Name "AD Object Age $([timespan]::fromseconds($Age).ToString("hh\:mm\:ss"))" -Value $Age;
  $result.WarnOutOfRange($Warning).CritOutOfRange($Critical) | Out-Null;

  return (New-IcingaCheckResult -Check $result -NoPerfData $NoPerfData -Compile);
}
