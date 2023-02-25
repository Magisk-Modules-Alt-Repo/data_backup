> **Warning**
> Work In progress

# data_backup

## Introduction

Script of creating User Data backup from booted system with root (subsequent restoring by data_restore.zip script).
  
### ***Advantages***

- creating and restoring data backup in the absence of TWRP for the device;
- a great opportunity to create a full backup with the contents of the internal memory or part of it, allowing you to restore an exact copy without reconfiguring the user after restoring;
- the speed of archiving and restoring is much more higher than TWRP;
- launch from a PC (useful when the display is crashed to take the backup);
- the ability to restore a backup created on a newly released version of Android, in the case when there is no TWRP for this Android yet;
- automatic needed reboot at the first login after restoring the backup in the presence of root;
- the presence of various options for creating / restoring a backup;
- the ability to restore a backup without TWRP from booted system with root;
- the universality of the method for different models of brands of devices on different versions of Android.

## Supported devices  
  
### ***First-grade support***
  
on my hands:
- Google Pixels
- HTC
  
### ***Others***

- Asus Rog Phone
  
some:
- Xiaomi
- POCO

## Requirement

- Android 7+ 
- Magisk 20.4+ 
- Optionally: Windows, macOS or Linux PC with [Android Platform Tools](https://developer.android.com/studio/command-line/adb) installed
- Optionally: External storage device (extSD or USB-OTG)

## Installing script

The script data_backup.sh will be integrated into the system by installing a Magisk module data_backup_v2.xx-MAGISK.zip.
- Download the module and copy it to internal storage.
- In the Magisk App: Modules - Install from storage - select the downloaded module .zip - Reboot. Done, now you can use it.

## Running script

There are 2 variants for running script, from device or PC therminal.
1. Main variant: From ***Android therminal***, for example [Material Terminal](https://play.google.com/store/apps/details?id=yarolegovich.materialterminal&pli=1) or another. 

    `su`
    
    `data_backup.sh`
    
2. From PC :

   `adb shell`
 
    `su`
    
    `data_backup.sh`

## Parameters at starting

### ***Without parameters*** (main & default)

The script will make data backup with all contents of internal device memory, except for folders of archives itself data backup and folders TWRP with backups.

### ***Parameters***

#1

`-e <path1> <path2> <...>` - to exclude from archive one or several catalogues of internal memory. Folders are listed through a blank. 
> NOTE: _Paths named with blanks accordingly are not supposed !_ 
>


