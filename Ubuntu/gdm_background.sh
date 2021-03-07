#!/usr/bin/env bash

# Script to set GDM background for Ubuntu 20.04
# Forked from https://github.com/thiggy01/ubuntu-20.04-change-gdm-background

USER_NAME=$(ls /home)
USER_HOME="/home/$USER_NAME"

# Install dependencies
apt-get update
apt-get install -y libglib2.0-dev-bin

# Assign the default gdm theme file path.
gdm3Resource=/usr/share/gnome-shell/theme/Yaru/gnome-shell-theme.gresource

# Define more variables.
gdm3xml=$(basename "$gdm3Resource").xml
workDir="/tmp/gdm3-theme"
gdmBgImg=$(realpath "/usr/share/backgrounds/1.jpg")
imgFile=$(basename "$gdmBgImg")

# Create directories from resource list.
for resource in $(gresource list "$gdm3Resource"); do
    resource="${resource#\/org\/gnome\/shell\/}"
    if [ ! -d "$workDir"/"${resource%/*}" ]; then
        mkdir -p "$workDir"/"${resource%/*}"
    fi
done

# Extract resources from binary file.
for resource in $(gresource list "$gdm3Resource"); do
    gresource extract "$gdm3Resource" "$resource" > \
    "$workDir"/"${resource#\/org\/gnome\/shell\/}"
done

# Copy selected image to the resources directory.
cp "$gdmBgImg" "$workDir"/theme

# Change gdm background to the image you submited.
oldImg="#lockDialogGroup \{.*?\}"
newImg="#lockDialogGroup {
background: url('resource:\/\/\/org\/gnome\/shell\/theme\/$imgFile');
background-size: cover; }"
perl -i -0777 -pe "s/$oldImg/$newImg/s" "$workDir"/theme/gdm3.css

# Generate gresource xml file.
echo '<?xml version="1.0" encoding="UTF-8"?>
<gresources>
<gresource prefix="/org/gnome/shell/theme">' > "$workDir"/theme/"$gdm3xml"
for file in $(gresource list "$gdm3Resource"); do
    echo "        <file>${file#\/org\/gnome/shell\/theme\/}</file>" \
    >> "$workDir"/theme/"$gdm3xml"
done
echo "        <file>$imgFile</file>" >> "$workDir"/theme/"$gdm3xml"
echo '    </gresource>
</gresources>' >> "$workDir"/theme/"$gdm3xml"

# Compile resources into a gresource binary file.
glib-compile-resources --sourcedir=$workDir/theme/ $workDir/theme/"$gdm3xml"

# Move the generated binary file to the gnome-shell folder.
mv $workDir/theme/gnome-shell-theme.gresource $gdm3Resource

# Check if gresource was sucessfuly moved to its default folder.
if [ "$?" -eq 0 ]; then
# Solve a permission change issue
    chmod 644 "$gdm3Resource"
fi

# Remove temporary directories and files.
rm -r "$workDir"

# Remove dependency
apt-get autoremove -y libglib2.0-dev-bin
