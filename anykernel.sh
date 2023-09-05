# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=Supra-Kernel
maintainer.string1=L1ghtzin_
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=1
device.name1=channel
supported.versions=10.0
supported.patchlevels=
'; } # end properties

# shell variables

block=/dev/block/by-name/boot;
is_slot_device=1;
ramdisk_compression=lzma;

#block=/dev/block/by-name/boot;
#is_slot_device=auto;
#ramdisk_compression=lzma;

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

# set permissions/ownership for included ramdisk files
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;

## AnyKernel install
dump_boot;

write_boot;
## end install
