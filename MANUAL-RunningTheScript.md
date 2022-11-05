# Running the PowerShell Script to Regenerate Previsibines

You should have prepared your plugin using the appropriate instructions:

[New Plugins](https://github.com/Aurelianis/PRPPatchingScript/blob/main/MANUAL-NewPlugin.md)<br>
[Patching Existing Plugin](https://github.com/Aurelianis/PRPPatchingScript/blob/main/MANUAL-PatchingPlugins.md)

## Run the Script

1) Open <b>Windows PowerShell</b>
2) Enter "cd pathtoscript" without quotes and hit enter. (i.e. cd D:\FO4Tools\PRPScript)
3) Enter "./GeneratePrevisibines.ps1" without quotes and hit enter.
4) Follow the prompts on the screen. There will be some interaction requires, such as running scripts in xEdit.
5) DO NOT try to do anyting else on your PC when running this script. 
6) Depending on how many cells are touched, this could take quite some time to complete.

## Prompts

1) Enter the exact file name with extension, i.e. PRP-Patch.esp
2) Enter the path to your Fallout 4 installation, i.e. D:\SteamLibrary\steamapps\common\Fallout 4 <b>NOTE:</b> This information will be saved to a text file, so the next time you run the script you will not see this prompt.
3) Enter the path to xEdit, include the exe, i.e. D:\FO4Tools\FO4Edit\FO4Edit.exe <b>NOTE:</b> This information will be saved to a text file, so the next time you run the script you will not see this prompt.
4) xEdit is now launching. Click OK, then Run 03_MergeCombinedObjects on PRP-BTInteriors_Project.esp. Save and exit.
5) xEdit is now launching. Click OK, then Run 05_MergePreVis_patched on PRP-BTInteriors_Project.esp. Save and exit.
