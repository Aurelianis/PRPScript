# What is this Script?

This is a PowerShell Script to assist in the generatation of precombined meshes and previs for Fallout 4. It is specifically for using PRP as a master.

1) Generates precombines using the Creation Kit.
2) Launches xEdit so that you can apply the 03_MergeCombinedObjects script on the patch plugin.
3) Deletes CombinedObject.esp
4) Compresses psg to csg and then deletes the psg file.
5) Adds the precombined meshes to a ba2 archive file to speed up previs generation. There is a limit to the number of precombined meshes you can have as loose files when generating Previs, so packing them ensures you don't reach this limit.
6) Generates CDX (Cell Index file).
7) Generates Previs.
8) Launches xEdit so you can apply the 05_MergePreVis_patched script on the patch plugin.
9) Deletes PreVis.esp.
10) Extracts the archive created in step 5, then creates a new archive with all the meshes and previs (vis folder).
11) Deletes the Meshes and Vis folders.
12) Cleans the esp.

## What do I need to get started?

1) A basic understanding of Windows and PowerShell. You need to know how to find items, extract files and know how to open and run a PowerShell script.
2) A basic understanding of xEdit. I go into a lot of detail in the instructions so pretty much anyone should be able to follow along but it does help to have at least used xEdit a few times.
3) Hard drive space. Precombine meshes can take up a lot of space and it takes even more when generating them.
4) Patience. It can take hours to get the patch ready, and hours to regenerate the previsibines depending on how many cells the mod touches. For example, my PRP patch for Beantown Interiors took over an hour to prep and another 3 hours to regenerte previsibines.

## Read the Wiki for Instructions
