# Patching a Plugin

## These instructions are for regenerating previsibines for someone else's plugin. 

### Before you begin:

Make sure you have the following plugins enabled in this order. If you are using Vortex, you may need to create a rule that your plugin Must Load After PRP.esp:<br>
- Fallout4.esm
- DLCRobot.esm
- DLCWorkshop01.esm
- DLCCoast.esm
- DLCworkshop02.esm
- DLCworkshop03.esm
- DLCNukaWorld.esm
- Unofficial Fallout 4 Patch.esp
- PPF.esm
- PRP.esp
- PluginToPatch.esp

### Prepare Your Plugin

1) Open <b>FO4Edit</b>.
2) Click <b>OK</b> on the <b>Module Selection</b> dialogue box.
3) Wait for the plugins to load. 
4) Click <b>OK</b> on the <b>Which ModGroups do you want to activate?</b> dialogue box (nothing should be checked). <b>NOTE:</b> if you want to remove this prompt, delete Unofficial Fallout 4 Patch.modgroups from your Fallout 4 Data folder.
5) Expand the plugin you are patching and select the <b>Cell</b> and <b>Worldspace</b> records (ctrl-click).
6) Right-click on <b>Cell</b> or <b>Worldspace</b> and choose <b>Deep copy as override into...</b>.
7) Select <b>new file.esp</b> in the <b>Which files do you want to add these records to?</b> dialogue box and click <b>OK</b>
8) Enter the name of your patch file (do not include the extension) and click <b>OK</b>. I normally use PRP-OriginalPluginName.
9) <b>Save</b>

#### If the plugin already regenerated previsibines, run the following scripts. If not, skip 10-16

10) Right-click your new plugin and choose <b>Apply Script...</b>
11) Choose <b>01_CopyCELLsIntoAutoPreCalc</b> from the <b>Script</b> dropdown, then click <b>OK</b> (This removes any generated previsibines).
12) Click <b>No</b> in the Confirm dialogue box (this selection uses the last loaded plugin, which is your patch plugin). <b>NOTE:</b> This may not actually do anything if the mod author hasn't regenerated previsibines, but I normally go ahead and run it anyway.
13) <b>Save</b>.
14) Right-click your new plugin and choose <b>Apply Script...</b>
15) Choose <b>02_RemovePreCalcFromCELLsLeaveNoPrevis</b> from the <b>Script</b> dropdown, then click <b>OK</b> (This removes any generated previsibines). 
16) <b>Save</b>.

#### Start back up here if the plugin did not regenerate previsibines

17) Right-click your new plugin and choose <b>Apply Script...</b>
18) Choose <b>Apply Material Swap</b> from the <b>Script</b> dropdown, then click <b>OK</b>.
19) <b>Save</b>.  
20) Right-click your plugin and choose <b>Add Masters...</b>.
21) Select all options (should be every plugin listed above except Fallout4.esm & YourPlugin.esp) in the <b>Which masters do you want to add?</b> dialogue box and click <b>OK</b>.
22) <b>Save</b>.
23) Right-click your plugin and choose <b>Sort Masters (to match current load order)</b>.
24) <b>Save</b>.
25) Right-click your plugin and choose <b>Apply Filter (selected files only)</b>
26) Check <b>by Record Signature</b> and scroll down to <b>NAVM - Navigation Mesh</b> and select it. Also select <b>Flatten Blocks/Sub-Blocks</b> and <b>Flatten Cell Children</b>. This makes it a lot easier to remove the entries.
27) Remove all Navigation Mesh entries from the new patch plugin. You need to drill down to the Navigation Mesh record. Do not remove anything above it.
28) Right-click and choose Remove Filter.
29) <b>Save</b>.
30) You can repeat steps 25-26 to verify all Navigation Mesh records have been removed.
31) Drill down through each cell and ensure that there is at least one record under Temporary. If not, Copy as override anything in that cell to create an intentional ITM (Identical to Master) record.
32) Right-click your plugin and choose <b>Apply Script...</b>
33) Choose <b>1000101-Apply_Version_Control_Information_To_Forms</b> from the <b>Script</b> dropdown, then click <b>OK</b>.
34) <b>Save</b>.
35) Exit FO4Edit.

## Run the PowerShell script

### Before running the script, backup the plugin so you can easily revert back if something goes wrong.

[Running the PowerShell Script](https://github.com/Aurelianis/PRPPatchingScript/blob/main/MANUAL-RunningTheScript.md)
