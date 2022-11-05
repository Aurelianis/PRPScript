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

$CreationKit = "$($FO4Directory)\CreationKit.exe"
$FO4DataPath = "$($FO4Directory)\Data"
$Archive2 = "$($FO4Directory)\Tools\Archive2\Archive2.exe"

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

#Create Temp Archive
Write-Host -f Yellow "Creating Archive to accelerate generation..."
Start-Process -FilePath $Archive2 -ArgumentList "`"$($FO4DataPath)\Meshes`" -c=`"$($FO4DataPath)\$PatchName - Main.ba2`"" -wait
Remove-Item -Path "$($FO4DataPath)\Meshes\" -Recurse
Write-Host -f Green "Done"

#GenerateCDX
if (Test-Path $CreationKit) {
   Write-Host -f Yellow "Generating CDX..."
   Start-Process -FilePath $CreationKit -ArgumentList "-buildcdx:$PatchFileName clean all" -wait
   Write-Host -f Green "Done"
} else {
   Write-Host -f Red "$($CreationKit) not found. Please make sure you followed the initial setup and try again."
}
	
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

#ARCHIVE
Write-Host -f Yellow "Adding New Files to Archive..." 
Start-Process -FilePath $Archive2 "`"$($FO4DataPath)\$PatchName - Main.ba2`" -e=`"$($FO4DataPath)`"" -wait
Start-Process -FilePath $Archive2 -ArgumentList "`"$($FO4DataPath)\Meshes`",`"$($FO4DataPath)\Vis`" -c=`"$($FO4DataPath)\$PatchName - Main.ba2`"" -wait
Remove-Item -Path "$($FO4DataPath)\Vis\","$($FO4DataPath)\Meshes\" -Recurse
Write-Host -f Green "Done"
	
#Clean ESP
Write-Host -f Yellow "Cleaning the ESP..."
Start-Process -FilePath $xEditPath -ArgumentList "-qac -autoexit -autoload $PatchFileName" -wait
Write-Host -f Green "All done! You will need the esp, ba2, csg & cdx files to use the patch. Load order should be PPF.esm, PluginToPatch.esp, PRP.esp, $($PatchFileName)"
