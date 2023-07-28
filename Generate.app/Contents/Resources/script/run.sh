#!/bin/sh
if [ ! -f "appsettings.conf" ]
then
  cd ../../../..
fi
if [ ! -f "appsettings.conf" ]
then
  echo "Please provide an appsettings.conf"
  echo "and a folder name \"script\" with your script"
  echo "in the same folder..."
  exit 0
fi
source appsettings.conf
ID=$(echo $APPNAME | sed 's/ //g')
DIR="$APPNAME.app/Contents/MacOS"
CONTENTS_DIR="$APPNAME.app/Contents"
RES_DIR="$APPNAME.app/Contents/Resources"
SCRIPT_DIR="$RES_DIR/script"
SCRIPT="run.sh"

mkdir icon.iconset
sips -z 16 16     icon.png --out icon.iconset/icon_16x16.png
sips -z 32 32     icon.png --out icon.iconset/icon_16x16@2x.png
sips -z 32 32     icon.png --out icon.iconset/icon_32x32.png
sips -z 64 64     icon.png --out icon.iconset/icon_32x32@2x.png
sips -z 128 128   icon.png --out icon.iconset/icon_128x128.png
sips -z 256 256   icon.png --out icon.iconset/icon_128x128@2x.png
sips -z 256 256   icon.png --out icon.iconset/icon_256x256.png
sips -z 512 512   icon.png --out icon.iconset/icon_256x256@2x.png
sips -z 512 512   icon.png --out icon.iconset/icon_512x512.png
cp icon.png icon.iconset/icon_512x512@2x.png
iconutil -c icns icon.iconset
rm -R icon.iconset


mkdir -p "$DIR"
mkdir -p "$RES_DIR"
mkdir -p "$SCRIPT_DIR"

cat << EOF > "$DIR/$APPNAME"
#!/bin/bash
scriptPath=\$(dirname "\$0")'/../Resources/script/$(basename $SCRIPT)'
cd "\$(dirname "\$0")'/../Resources/script'"
WORKDIR="\$(dirname "\$0")/../Resources/script"
osascript -e "tell app \\"Terminal\\" to do script \\"cd \\\\\\"\$WORKDIR\\\\\\" && ./$(basename $SCRIPT)\\""
EOF



cat << EOF > "$CONTENTS_DIR/Info.plist"
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CFBundleAllowMixedLocalizations</key>
	<true/>
	<key>CFBundleDevelopmentRegion</key>
	<string>English</string>
	<key>CFBundleExecutable</key>
	<string>$APPNAME</string>
	<key>CFBundleIconFile</key>
	<string>$APPNAME</string>
	<key>CFBundleIdentifier</key>
	<string>com.apple.script.id.$ID</string>
	<key>CFBundleInfoDictionaryVersion</key>
	<string>6.0</string>
	<key>CFBundleName</key>
	<string>$ID</string>
	<key>CFBundlePackageType</key>
	<string>APPL</string>
	<key>CFBundleShortVersionString</key>
	<string>1.0</string>
	<key>LSMinimumSystemVersionByArchitecture</key>
	<dict>
		<key>x86_64</key>
		<string>10.6</string>
	</dict>
</dict>
</plist>
EOF


cp -R "script" "$RES_DIR"
cp icon.icns "$RES_DIR/$APPNAME.icns"

chmod +x "$DIR/$APPNAME"
chmod +x "$RES_DIR/script/$(basename $SCRIPT)"

echo "$PWD/$APPNAME.app"
