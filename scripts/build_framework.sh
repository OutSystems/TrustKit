SCRIPTS_FOLDER="scripts/build"
BUILD_SCHEME="TrustKit"
FRAMEWORK_NAME="TrustKit"
SIMULATOR_ARCHIVE_PATH="${SCRIPTS_FOLDER}/iphonesimulator.xcarchive"
IOS_DEVICE_ARCHIVE_PATH="${SCRIPTS_FOLDER}/iphoneos.xcarchive"

rm -rf "${FRAMEWORK_NAME}.zip"
rm -rf ${SCRIPTS_FOLDER}

xcodebuild archive \
	-scheme ${BUILD_SCHEME} \
	-configuration Release \
	-destination 'generic/platform=iOS Simulator' \
	-archivePath "./${SIMULATOR_ARCHIVE_PATH}/" \
	SKIP_INSTALL=NO \
	BUILD_LIBRARIES_FOR_DISTRIBUTION=YES \
	PRODUCT_NAME="${FRAMEWORK_NAME}"

xcodebuild archive \
	-scheme ${BUILD_SCHEME} \
	-configuration Release \
	-destination 'generic/platform=iOS' \
	-archivePath "./${IOS_DEVICE_ARCHIVE_PATH}/" \
	SKIP_INSTALL=NO \
	BUILD_LIBRARIES_FOR_DISTRIBUTION=YES \
	PRODUCT_NAME="${FRAMEWORK_NAME}"

xcodebuild -create-xcframework \
	-framework "./${SIMULATOR_ARCHIVE_PATH}/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework" \
		-debug-symbols "${PWD}/${SIMULATOR_ARCHIVE_PATH}/dSYMs/${FRAMEWORK_NAME}.framework.dSYM" \
	-framework "./${IOS_DEVICE_ARCHIVE_PATH}/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework" \
		-debug-symbols "${PWD}/${IOS_DEVICE_ARCHIVE_PATH}/dSYMs/${FRAMEWORK_NAME}.framework.dSYM" \
	-output "./${SCRIPTS_FOLDER}/${FRAMEWORK_NAME}.xcframework"

(cd "./${SCRIPTS_FOLDER}" && zip -r - "${FRAMEWORK_NAME}.xcframework") >"${FRAMEWORK_NAME}.zip"