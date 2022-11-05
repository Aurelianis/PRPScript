# Regenerating Previsibines with PRP

## What do I need to get started?

1) A basic understanding of Windows and PowerShell. You need to know how to find items, extract files and know how to open and run a PowerShell script.
2) A basic understanding of xEdit. I go into a lot of detail in the instructions so pretty much anyone should be able to follow along but it does help to have at least used xEdit a few times.
3) Patience. It can take hours to get the patch ready, and hours to regenerate the previsibines depending on how many cells the mod touches. For example, my PRP patch for Beantown Interiors took over an hour to prep and another 3 hours to regenerte previsibines.

## Before you begin:

Perform a [Clean install of Fallout 4](https://github.com/Aurelianis/PRPPatchingScript/blob/main/MANUAL-FO4CleanInstall.md).

## Install Tools

Install [Fallout 4: Creation Kit](https://github.com/Aurelianis/PRPPatchingScript/blob/main/MANUAL-InstallCreationKit.md).

### Download and extract the following:

To keep everything organized, create a folder and the following tools to that folder. I use D:\FO4Tools for example.

[Steamless](https://github.com/atom0s/Steamless/releases/tag/v3.1.0.0)<br>
[FO4Edit](https://www.nexusmods.com/fallout4/mods/2737)<br>
[GeneratePrevisibines.ps1](https://github.com/Aurelianis/PRPPatchingScript/blob/main/GeneratePrevisibines.ps1)

### Download and install xEdit scripts

The following xEdit (FO4Edit) scripts need to be extracted to the Edit Scripts folder where you extracted FO4Edit, i.e. D:\FO4Tools\FO4Edit\Edit Scripts

[PrecombinePrevisSneakPeek.zip by SeargeDP](https://forums.nexusmods.com/index.php?/topic/5522717-fallout-4-optimization-and-performance-systems-explained/page-52#entry100828598)<br>
01_CopyCELLsIntoAutoPreCalc.pas<br>
03_MergeCombinedObjects.pas<br>
[Pra’s FO4Edit Scripts](https://www.nexusmods.com/fallout4/mods/28898)<br>
Apply Material Swap.pas<br>
[ModernPrecombines](https://github.com/Diskmaster/ModernPrecombines/tree/main/scripts)<br>
1000101-Apply_Version_Control_Information_To_Forms.pas<br>
05_MergePreVis_patched.pas<br>
02_RemovePreCalcFromCELLsLeaveNoPrevis.pas<br>

## Creation Kit Fixes

[Run Steamless](https://github.com/Aurelianis/PRPPatchingScript/blob/main/MANUAL-RunSteamless.md) Follow the instructions carefully.<br>
Download [F4 Creation Kit Fixes](https://www.nexusmods.com/fallout4/mods/51165). Be sure to follow the instructions carefully. There are some things you need to install to get this working properly. The mod itself can be installed using Vortex. Just be sure to double-click and choose <b>Engine Injector</b> under <b>Mod Type</b>.<br>
Download [f4ck_loader.exe](https://github.com/Perchik71/Fallout4Test/releases/download/1.6/f4ck_loader.7z) and extract it to your Fallout 4 installation directory.

## Install PRP

You can use any mod manager for this. I'm familiar with Vortex, so any examples will be for Vortex.

Install [Previsibines Repair Pack (PRP)](https://www.nexusmods.com/fallout4/mods/46403) Vortex will come up with a notification stating there are multiple plugins. Enable all. PPF.esm is a master file that contains fixes. PRP.esp is an ESL flagged esp that regenerates previsibines based on changes made in PPF.esm.<br> 


## You're ready to start!

[New Plugins](https://github.com/Aurelianis/PRPPatchingScript/blob/main/MANUAL-NewPlugin.md)<br>
[Patching Existing Plugin](https://github.com/Aurelianis/PRPPatchingScript/blob/main/MANUAL-PatchingPlugins.md)


#### If you are going to be doing a lot of patching and have the space, once you have completed the initial setup, make a copy of your Fallout 4 install folder. When you are done with patching, rename the Fallout 4 folder to Fallout 4 - Dev (or something that makes sense to you) and then rename the copy you made to Fallout 4. Then you can use it for playing the game. When you want to do another patch, rename Fallout 4 to Fallout 4 - Prod and Fallout 4 - Dev to Fallout 4. You can easily switch back and forth this way. If you use Vortex, be sure to shut it down before rename the folders.
