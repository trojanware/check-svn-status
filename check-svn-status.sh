dir_name=$(readlink -m $1)
echo "Fetching svn status for : $dir_name"
echo "Files In Conflict: "
svn st $dir_name | awk -F ' ' '$1 == "C" {print $2}' | sed 's,^,|___,;s,'"$dir_name"\/',,;'
echo "Files Modified : "
svn st $dir_name | awk -F ' ' '$1 == "M" {print $2}' | sed 's,^,|___,;s,'"$dir_name"\/',,;'
echo 'Files Not Added : '
svn st $dir_name | awk -F ' ' '$1 == "?" {print $2}' | sed 's,^,|___,;s,'"$dir_name"\/',,;'
