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
7) Select <b><new file>.esp</b> in the <b>Which files do you want to add these records to?</b> dialogue box and click <b>OK</b>
8) Enter the name of your patch file (do not include the extension) and click <b>OK</b>.
9) <b>Save</b>
10) Right-click your new plugin and choose <b>Apply Script...</b>
11) Choose <b>01_CopyCELLsIntoAutoPreCalc</b> from the <b>Script</b> dropdown, then click <b>OK</b>.
12) <b>Save</b>.
13) Right-click your new plugin and choose <b>Apply Script...</b>
14) Choose <b>02_RemovePreCalcFromCELLs</b> from the <b>Script</b> dropdown, then click <b>OK</b>.
15) <b>Save</b>.
16) Right-click your new plugin and choose <b>Apply Script...</b>
17) Choose <b>Apply Material Swap</b> from the <b>Script</b> dropdown, then click <b>OK</b>.
18) <b>Save</b>.  
19) Right-click your plugin and choose <b>Add Masters...</b>.
20) Select all options (should be every plugin listed above except Fallout4.esm & YourPlugin.esp) and click <b>OK</b>.
21) <b>Save</b>.
22) Right-click your plugin and choose <b>Sort Masters (to match current load order)</b>.
23) <b>Save</b>.
24) Right-click your plugin and choose <b>Apply Script...</b>
25) Choose <b>1000101-Apply_Version_Control_Information_To_Forms</b> from the <b>Script</b> dropdown, then click <b>OK</b>.
26) <b>Save</b>.
27) Exit FO4Edit.
