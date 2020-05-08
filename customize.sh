##########################################################################################
# SKIPUNZIP
##########################################################################################

# If you need even more customization and prefer to do everything on your own, declare SKIPUNZIP=1 in customize.sh to skip the extraction and applying default permissions/secontext steps.
# Be aware that by doing so, your customize.sh will then be responsible to install everything by itself.
SKIPUNZIP=0

##########################################################################################
# Replace list
##########################################################################################

# List all directories you want to directly replace in the system
# Check the documentations for more info why you would need this

# Construct your list in the following format
# This is an example
REPLACE_EXAMPLE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

# Construct your own list here
REPLACE="
"
##########################################################################################
# Install
##########################################################################################

# If SKIPUNZIP = 1 you will need to use the following code
# Of course, you can also customize the installation rules
# Please remove when needed #
#  # Extract $ZIPFILE/system to $MODPATH
#  ui_print "- Extracting module files"
#  unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
#  unzip -o "$ZIPFILE" 'module.prop' -d $MODPATH >&2
#  unzip -o "$ZIPFILE" 'system.prop' -d $MODPATH >&2
#  unzip -o "$ZIPFILE" 'sepolicy.rule' -d $MODPATH >&2
#  unzip -o "$ZIPFILE" 'service.sh' -d $MODPATH >&2
#  unzip -o "$ZIPFILE" 'post-fs-data.sh' -d $MODPATH >&2
#  unzip -o "$ZIPFILE" 'uninstall.sh' -d $MODPATH >&2

##########################################################################################
# Permissions
##########################################################################################

set_permissions() {
  : # Remove this if adding to this function

  # Note that all files/folders in magisk module directory have the $MODPATH prefix - keep this prefix on all of your files/folders
  # Some examples:
  
  # For directories (includes files in them):
  # set_perm_recursive  <dirname>                <owner> <group> <dirpermission> <filepermission> <contexts> (default: u:object_r:system_file:s0)
  
  # set_perm_recursive $MODPATH/system/lib 0 0 0755 0644
  # set_perm_recursive $MODPATH/system/vendor/lib/soundfx 0 0 0755 0644

  # For files (not in directories taken care of above)
  # set_perm  <filename>                         <owner> <group> <permission> <contexts> (default: u:object_r:system_file:s0)
  
  # set_perm $MODPATH/system/lib/libart.so 0 0 0644
  # set_perm /data/local/tmp/file.txt 0 0 644
  
  # The following is the default rule, DO NOT remove
  set_perm_recursive $MODPATH 0 0 0755 0644
}

