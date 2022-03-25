#!/bin/bash
set -euo pipefail

PROJECT_DIR=$(dirname "$PWD")
echo -e "项目资源目录: ${PROJECT_DIR}"

pushd $PROJECT_DIR

PROJECT_NAME=PPILibrary
BUILD_DIR="build"
ARCHIVE_PATH="${BUILD_DIR}/${PROJECT_NAME}"

rm -rf $BUILD_DIR
clear
echo -e "当前路径 '$(pwd)'"

# Generate iOS framework
xcodebuild archive -project ${PROJECT_NAME}.xcodeproj -scheme $PROJECT_NAME -configuration Release -sdk iphoneos -archivePath "${ARCHIVE_PATH}-iphoneos.xcarchive" -destination "generic/platform=iOS" SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES OTHER_CFLAGS="-fembed-bitcode" BITCODE_GENERATION_MODE="bitcode" ENABLE_BITCODE=YES | xcpretty --color --simple
# Generate iOS Simulator framework
xcodebuild archive -project ${PROJECT_NAME}.xcodeproj -scheme $PROJECT_NAME -configuration Release -sdk iphonesimulator -archivePath "${ARCHIVE_PATH}-iossimulator.xcarchive" -destination "generic/platform=iOS Simulator" SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES OTHER_CFLAGS="-fembed-bitcode" BITCODE_GENERATION_MODE="bitcode" ENABLE_BITCODE=YES | xcpretty --color --simple
# Generate macOS framework
#xcodebuild archive -project ${PROJECT_NAME}.xcodeproj -scheme $PROJECT_NAME -configuration Release -sdk macos -archivePath "${ARCHIVE_PATH}-macosx.xcarchive" -destination "generic/platform=macOS,name=Any Mac" SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES OTHER_CFLAGS="-fembed-bitcode" BITCODE_GENERATION_MODE="bitcode" ENABLE_BITCODE=YES | xcpretty --color --simple

echo -e "当前路径 "$(pwd)""
echo -e "归档路径: ${ARCHIVE_PATH}"

# Generate XCFramework
pushd $BUILD_DIR
clear 
echo "$PWD"
echo "$(ls -lh)"


function GetUUID() {
	# dwarfdump output:
	# UUID: FFFFFFF-AAAAA-BBBB-CCCC-DDDDDDDDDD (arm64) PATH_TO_ARCHIVE/FRAMEWORK.framework-ios-arm64.xcarchive/Products/Library/Frameworks/FRAMEWORK.framework/FRAMEWORK
	local arch=$1
	local binary=$2
	local dwarfdump_result=$(dwarfdump -u ${binary})
	local regex="UUID: (.*) \((.*)\)"
	if [[ $dwarfdump_result =~ $regex ]]; then
		local result_uuid="${BASH_REMATCH[1]}"
		local result_arch="${BASH_REMATCH[2]}"
		if [ "$result_arch" == "$arch" ]; then
			echo $result_uuid
		fi
	fi
}

# First, find UUID for BCSymbolMaps of our binary, because these are randomly generated. The dSYM path is always the same so that one is manually added
# Simulator-targeted archives don't generate BCSymbolMap files, so this is only needed for iphone target
BCSYMBOLMAP_UUID=$(GetUUID "arm64" "${PROJECT_NAME}-iphoneos.xcarchive/Products/Library/Frameworks/${PROJECT_NAME}.framework/${PROJECT_NAME}")

if [[ -n $BCSYMBOLMAP_UUID && $BCSYMBOLMAP_UUID != "" ]]; then
	echo -e ">>>> Finded out UUID: <${BCSYMBOLMAP_UUID}>"
	
	xcodebuild -create-xcframework \
	-framework "${PROJECT_NAME}-iphoneos.xcarchive/Products/Library/Frameworks/${PROJECT_NAME}.framework" \
	-debug-symbols "$PWD/${PROJECT_NAME}-iphoneos.xcarchive/dSYMs/${PROJECT_NAME}.framework.dSYM" \
	-debug-symbols "$PWD/${PROJECT_NAME}-iphoneos.xcarchive/BCSymbolMaps/${BCSYMBOLMAP_UUID}.bcsymbolmap" \
	-framework "${PROJECT_NAME}-iossimulator.xcarchive/Products/Library/Frameworks/${PROJECT_NAME}.framework" \
	-debug-symbols "$PWD/${PROJECT_NAME}-iossimulator.xcarchive/dSYMs/${PROJECT_NAME}.framework.dSYM" \
	#-framework "${PROJECT_NAME}-macosx.xcarchive/Products/Library/Frameworks/${PROJECT_NAME}.framework" \
	#-debug-symbols "${PWD}/${PROJECT_NAME}-macosx.xcarchive/dSYMs/${PROJECT_NAME}.framework.dSYM" \
	-allow-internal-distribution \
	-output "${PROJECT_NAME}.xcframework"
	popd
	
	# Zip it!
	echo -e "Zip: $(PWD)"
	zip -r "./$BUILD_DIR/${PROJECT_NAME}.xcframework.zip" "./$BUILD_DIR/${PROJECT_NAME}.xcframework"
	
else
	echo -e "获取失败"
fi
	
popd
echo  -e "回到脚本所在路径： $PWD"
