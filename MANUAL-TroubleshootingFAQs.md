# Troubleshooting & FAQs

## FAQs

### How do I know if Precombines have been broken?
Easiest way is to open the plugin in xEdit and expand the Cell and/or Worldspace records. If any of the placed objects have brackets like this [Placed Object] then precombines have been broken. You can then check the VISI - PreVis Files Timestamp and PCMB - Precombined Files Timestamp to see if they have been regenerated (the dates won't match Fallout4.esm (or the DLCs if it's a cell from one of them).

## Troubleshooting

### Error about missing registry entries when starting FO4Edit
You did not start Fallout 4 at least once after performing a clean install.

### Error when running GeneratePrevisibines.ps1 cannot be loaded because the execution of scripts is disabled on this system.
Either bypass the execution for the script using powershell -ExecutionPolicy ByPass -File GeneratePrevisibines.ps1
OR
Change the policy using Set-ExecutionPolicy RemoteSigned and Type [A] for Yes To All
