$rootDir = (Get-Location).Path
Get-ChildItem -Recurse -Include *.c | ForEach-Object {
 $relativePath = ($_.FullName).Replace($rootDir + "\", "")
 $relativePath
}