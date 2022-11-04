# Regenerating Previsibines for a New Plugin

## These instructions are for regenerating previsibines in a plugin that you created yourself. 

NOTE: Always keep a version of the plugin available before regenerating previsibines. It makes it easier to update if needed.

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
- YourPlugin.esp

### Prepare Your Plugin

1) Open FO4Edit.
2) Click <b>OK</b> on the <b>Module Selection</b> dialogue box.
3) Wait for the plugins to load. 
4) Click <b>OK</b> on the <b>Which ModGroups do you want to activate?</b> dialogue box (nothing should be checked). <b>NOTE:</b> if you want to remove this prompt, delete Unofficial Fallout 4 Patch.modgroups from your Fallout 4 Data folder.
5) Right-click your plugin and choose <b>Apply Script...</b>
6) Choose <b>Apply Material Swap</b> from the <b>Script</b> dropdown, then click <b>OK</b>.
7) Save the plugin.
8) Right-click your plugin and choose <b>Add Masters...</b>.
9) Select all options (should be every plugin listed above except Fallout4.esm & YourPlugin.esp) and click <b>OK</b>.
10) Save the plugin.
11) Right-click your plugin and choose <b>Sort Masters (to match current load order)</b>.
12) Save the plugin.
13) Right-click your plugin and choose <b>Apply Script...</b>
14) Choose <b>1000101-Apply_Version_Control_Information_To_Forms</b> from the <b>Script</b> dropdown, then click <b>OK</b>.
15) Save the plugin.
16) Exit xEdit.
