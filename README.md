Setup the serivce to execute the Invoke-UpdateADObjectAge on ONE domain controller ONLY.  This will stamp an object in AD with Unix time format in the description.

On all of the domain controllers, add the Invoke-CheckADObjectAge.  This will compare the local DC's time to the time in the desired object's time in the description.

If the time goes out of range, it will issue a warning.  If it falls further out of range it will go critical.

This will test to ensure all DC's in the domain are replicating objects across all DC's.
