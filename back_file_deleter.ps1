$folder_path="D:\BackFile";
"Deleting backup files from '"+$folder_path +"' which are older than 7 days."
$today_date=get-date
$least_date_allowed=$today_date.AddDays(-7)
Get-ChildItem $folder_path | Where-Object { $_.LastWriteTime -lt $least_date_allowed  } | Where {$_.Extension -match "bak"} | Remove-Item -force
Read-Host -Prompt 'Backup files deleted successfully. Press enter to exit'