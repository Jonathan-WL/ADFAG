# Automated Digital Forensic Artefact Gathering

A PowerShell script to collect system information, network artefacts, event logs, Kape modules, memory, etc. for incident response.

Execution:
- Open PowerShell as Adminstrator
- Use '$PSVersionTable' for PowerShell version. This should be 5.1 or above
- Execute the Get-ExecutionPolicy
- If the respnse shows Restricted, run 'Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process' for bypassing admin rights for the current session
- Navigate to the USB device
- Execute ./ADFAG.ps1

USB need needs to include:
- - File 1: “Memory” – Winpmem
- - Subdir 1: ”KAPE” – directory (copied from local install)
