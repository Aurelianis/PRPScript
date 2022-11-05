#Variables
$PatchFileName = Read-Host "Enter the exact file name with extension, i.e. PRP-Patch.esp"
$PatchName = [System.IO.Path]::GetFileNameWithoutExtension($PatchFileName)

#Get and save FO4 install path
if (!(Test-Path "FO4Path.txt")) {
   $FO4Directory = Read-Host "Enter the path to your Fallout 4 installation, i.e. D:\SteamLibrary\steamapps\common\Fallout 4"
   New-Item FO4Path.txt
   Set-Content FO4Path.txt $FO4Directory
} else {
   $FO4Directory = get-Content "FO4Path.txt"
}

$CreationKit = "$($FO4Directory)\f4ck_loader.exe"
$FO4DataPath = "$($FO4Directory)\Data"

#Get and save xEdit path
if (!(Test-Path "xEditPath.txt")) { 
   $xEditPath = Read-Host "Enter the path to xEdit, include the exe, i.e. D:\FO4Tools\FO4Edit\FO4Edit.exe"
   New-Item xEditPath.txt
   Set-Content xEditPath.txt $xEditPath
} else { 
   $xEditPath = get-Content "xEditPath.txt"
}


Write-Host "Using $CreationKit for generation"


#Start generating precombines
if (Test-Path $CreationKit) {
   Write-Host -f Yellow "Generating Precombines..."
   Start-Process -FilePath $CreationKit -ArgumentList "-GeneratePrecombined:$PatchFileName clean all" -wait
   Write-Host -f Green "Done"
   Write-Host -f Yellow "xEdit is now launching. Click OK, then Run 03_MergeCombinedObjects on $($PatchFileName). Save and exit."
   Start-Process -FilePath $xEditPath -ArgumentList "-nobuildrefs -quickedit:CombinedObjects.esp" -wait
   Remove-item "$($FO4DataPath)\CombinedObjects.esp"
   Write-Host -f Yellow "Compressing PSG..."
   Start-Process -FilePath $CreationKit -ArgumentList "-CompressPSG:$PatchFileName" -wait
   Write-Host -f Green "Done"
   if (Test-Path "$($FO4DataPath)\$PatchName - Geometry.csg") {
      Remove-Item -Path "$($FO4DataPath)\$PatchName - Geometry.psg"
   } else {
      Write-Host -f Red "Failure generating precombines. Cleaning up..."
      Remove-Item -Path "$($FO4DataPath)\$PatchFileName","$($FO4DataPath)\$PatchName.cdx","$($FO4DataPath)\$PatchName - Geometry.csg"
      Write-Host -f Green "Done. Please restart the script."
      exit
   }
} else {
   Write-Host -f Red "$($CreationKit) not found. Please make sure you followed the initial setup and try again."
}

#GenerateCDX
if (Test-Path $CreationKit) {
   Write-Host -f Yellow "Generating CDX..."
   Start-Process -FilePath $CreationKit -ArgumentList "-buildcdx:$PatchFileName clean all" -wait
   Write-Host -f Green "Done"
} else {
   Write-Host -f Red "$($CreationKit) not found. Please make sure you followed the initial setup and try again."
}

Start-Process -FilePath $xEditPath -ArgumentList "-qac -autoexit -autoload $PatchFileName" -wait
	
#Generate PREVIS
if (Test-Path $CreationKit) {
   Write-Host -f Yellow "Generating PreVis..."
   Start-Process -FilePath $CreationKit -ArgumentList "-GeneratePreVisdata:$PatchFileName clean all" -wait
   Write-Host -f Green "Done"
   Write-Host -f Yellow "xEdit is now launching. Click OK, then Run 05_MergePreVis_patched on $($PatchFileName). Save and exit."
   Start-Process -FilePath $xEditPath -ArgumentList "-nobuildrefs -quickedit:PreVis.esp" -wait
   Remove-Item -Path "$($FO4DataPath)\PreVis.esp"
} else {
   Write-Host -f Red "$($CreationKit) not found. Please make sure you followed the initial setup and try again."
}
	
#Clean ESP
Write-Host -f Yellow "Cleaning the ESP..."
Start-Process -FilePath $xEditPath -ArgumentList "-qac -autoexit -autoload $PatchFileName" -wait
Write-Host -f Green "All done! Use Archive2 to create a ba2 file containing Meshes\Precombined and Vis folders"
