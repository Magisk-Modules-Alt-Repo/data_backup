
# data_backup

## Introduction

Script of creating User Data backup from booted system with root (subsequent restoring by ![data_restore.zip](https://github.com/ziandzivan/data_restore) script).
  
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

### ***Screenshots***

<img width="300" height="600" src="https://raw.githubusercontent.com/ziandzivan/data_backup/main/assets/Screenshot_20230226-130051.png"> <img width="700" height="600" src="https://raw.githubusercontent.com/ziandzivan/data_backup/main/assets/2023-02-26_16-00-21.png">

## Supported devices  
  
### ***First-grade support***
  
on my hands:
- Google Pixels
- HTC
  
### ***Others***

- Asus Rog Phone
  
some:
- Xiaomi, POCO

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
    
2. From ***PC therminal*** :

   `adb shell`
 
    `su`
    
    `data_backup.sh`

## Parameters at starting

### ***Without parameters*** (main & default)

The script will make data backup with all contents of internal device memory, except for folders of archives itself data backup and folders TWRP with backups.

### ***Parameters***

***#1***

`-e <path1> <path2> <...>` - to ***exclude*** from archive one or several catalogues of internal memory. Folders are listed through a blank. 
> NOTE: _Paths named with blanks accordingly are not supposed !_ 
>
Example 1.1: `data_backup.sh -e DCIM Download Pictures/Screenshots My_Music`

There is posible to specify folders names with ***Pattern Matching:***

Example 1.2: `data_backup.sh -M -e DCIM *ownload Pictures/Screen* iG[oO]* [mW]*`

where:

`*ownload` - folders names in the root of intSD with "ownload" in the end of names;

`Pictures/Screen*` - all subdirectories beginning on "Screen" in catalogue "Pictures" of internal SD;

`iG[oO]*` - all catalogues beginning on iGo without sensitivity the register of the letter "o";

`[mW]*` - names begin on letters "m" or "W".


***#2***

`-m` - to exclude from created backup ALL content of the internal storage. This variant is similar as official TWRPs create data backups (without ***media***).

Example: `data_backup.sh -m`

***#3***

`-M` - forced creation of ***Multy-volume*** backup on any storage device in exFAT format for possible coping and restoring from the external SD in FAT32. 

This key is not obligatory at backuping directly on external SD in FAT32 because in this case the script automatically creates Multivolume archive up to 4GB of each volume. 

The key, as the first specified, can be used together with key `-m` or `-e <path1> ...`. 

Example: `data_backup.sh -M -e Download`

***#4***

`-h` - to show ***help*** message and exit.

## Created files

The backup is saving into folder `databackup` in the root of a storage device.
In case of next backuping, the folder `databackup` of a previous backup is automatically renamed to `databackup_<year-month-date_time>` :
<!--
![image-1](https://github.com/ziandzivan/data_backup/blob/main/assets/Screenshot_Folders_databackup_20220420-224223.png)
-->

<img width="300" height="600" src="https://raw.githubusercontent.com/ziandzivan/data_backup/main/assets/Screenshot_Folders_databackup_20220420-224223.png">  <img width="300" height="600" src="https://raw.githubusercontent.com/ziandzivan/data_backup/main/assets/Screenshot_inside_databackup_20220420-224252.png">

Inside databackup folder  there are files for a latest backup :
  -  `data*.tar` - archive files of the backup;
  -  `check_sum.sha1` - hash-file of archive files data*.tar;
  -  `datarestore.log` - log-file of restoring user data;
  -  `databackup.log` - log-file of backuping user data.

File databackup.log has info for correct restoring backup:

<img width="300" height="600" src="https://raw.githubusercontent.com/ziandzivan/data_backup/main/assets/2023-02-26_20-59-33.png"> <img width="300" height="600" src="https://raw.githubusercontent.com/ziandzivan/data_backup/main/assets/2023-02-26_21-00-29.png">

- backuping date;
- system software number;
- including intSD (yes/no);
- excluding folders from intSD;
- Magisk version;
- screen settings.

In the end of the file there is info about successful backuping or error code (in last case data*.tar archives will be deleted).

> **Warning**
> - Restoring backup is ONLY from the folder `databackup` in the root of a storage. 
> - Do not rename the folder and data*.tar files !
> - Any editing of the archive data*.tar files is not allowed for correct restoring !

## Features of script working

- Data backup automatically will be created on external storage device if it is mounted. First the script is looking for mounted USB-OTG, then extSD and after intSD. You can unmount external SDs for creating the backup on internal SD.
- If external SD in FAT32, the backup will be created automatically by Multy-volume archive files up to 4GB of each. 
- To avoid error 1, do not use your smartphone and do not switch off the screen during backuping.
- After starting the script switches on Air plane mode, reduces the screen brightness.
- Running calculating hash-checksum will be started in the background after successful backuping, Air plane mode will be switched off, screen settings will be restored. At this time you can use your device.
- User itself has to check if enough free space for backup.
- Save created backup on intSD by copying databackup folder somewhere to PC, cloud and so on.

## Probable mistakes

- Backup will not be saved at any error during backuping. 
- Error 2: "Failure. Error 2. Not enough place on storage device". Care about enough free place.
- Error 1: "Failure. Error 1". It means about other mistakes of recording on a storage device. Do not use your device and do not switch off a screen during backuping. Restart data backup cript.

_Additional info:_

a link of script attachments: https://github.com/ziandzivan/attachments_of_data_backup
