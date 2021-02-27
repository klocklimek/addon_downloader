$addons_git = @(
"https://github.com/DeadlyBossMods/DeadlyBossMods"
)

if(-Not (Test-Path _retail_ )){
    Write-Output "Umieść plik w folderze WoWa"
    exit
}
if(Test-Path enklawa) {
    Write-output "Już chyba byłem uruchomiony(?). Pozbadz sie folderu enklawa"
    exit
}
else {
    $null = New-Item "enklawa" -ItemType "Directory"
}
$wow_dir = Get-Location
$enklawa_dir = $wow_dir.ToString() +"\enklawa"
Write-Output "Ściagam Ajoura..."
wget "https://github.com/ajour/ajour/releases/latest/download/ajour.exe" -UseBasicParsing -OutFile "enklawa\ajour.exe"

$output = enklawa/ajour.exe --data "$enklawa_dir" update | Out-String
$ajour_config = Get-Content -Path ".\enklawa\ajour.yml"
$ajour_wow_dir = " directory: " + '"' + $wow_dir.ToString() + '"'
$ajour_wow_dir = $ajour_wow_dir -replace "\\", "\\"
$ajour_config = $ajour_config -replace " directory: ~", $ajour_wow_dir
$ajour_config | Set-Content -Path ".\enklawa\ajour.yml"

Write-Output "Instaluje addony..."
foreach($addon in $addons_git){
$output = enklawa/ajour.exe --data "$enklawa_dir" install retail $addon  | Out-String
Write-Output $output
}

Write-Output "Sprzatam..."
Get-ChildItem -Path "enklawa" -Recurse | Remove-Item -force -recurse
Remove-Item "enklawa" -Force 