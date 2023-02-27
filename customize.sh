# Make module binaries executable (needed for some magisk versions such as 20.4 )

set_perm  $MODPATH/system/bin/data_backup.sh  0  0  0755
