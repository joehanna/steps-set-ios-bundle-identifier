#!/bin/bash

# exit if a command fails
set -e

#
# Required parameters
if [ -z "${info_plist_file}" ] ; then
  echo " [!] Missing required input: info_plist_file"
  exit 1
fi
if [ ! -f "${info_plist_file}" ] ; then
  echo " [!] File Info.plist doesn't exist at specified path: ${info_plist_file}"
  exit 1
fi

if [ -z "${bundle_identifier}" ] ; then
  echo " [!] No Bundle Identifier (bundle_identifier) specified!"
  exit 1
fi

if [ -z "${bundle_name}" ] ; then
  echo " [!] No Bundle Name (bundle_name) specified!"
  exit 1
fi

if [ -z "${bundle_display_name}" ] ; then
  echo " [!] No Bundle Display Name (bundle_display_name) specified!"
  exit 1
fi

# ---------------------
# --- Configs:

echo " (i) Provided Info.plist file path : ${info_plist_file}"
echo " (i) Provided Bundle Identifier    : ${bundle_identifier}"
echo " (i) Provided Bundle Name (short)  : ${bundle_name}"
echo " (i) Provided Bundle Display Name  : ${bundle_display_name}"

# ---------------------
# --- Main:

# verbose / debug print commands
set -v

# ---- Set Info.plist Bundle Identifier:
echo ""
echo ""
echo " (i) Replacing Bundle Identifier..."

ORIGINAL_BUNDLE_IDENTIFIER="$(/usr/libexec/PlistBuddy -c "Print :CFBundleIdentifier" "${info_plist_file}")"
echo " (i) Original Bundle Identifier: $ORIGINAL_BUNDLE_IDENTIFIER"

/usr/libexec/PlistBuddy -c "Set :CFBundleIdentifier ${bundle_identifier}" "${info_plist_file}"

REPLACED_BUNDLE_IDENTIFIER="$(/usr/libexec/PlistBuddy -c "Print :CFBundleIdentifier" "${info_plist_file}")"
echo " (i) Replaced Bundle Identifier: $REPLACED_BUNDLE_IDENTIFIER"

# ==> Bundler Identifier patched in Info.plist file for iOS project


# ---- Set Info.plist Bundle Name:
echo ""
echo ""
echo " (i) Replacing Bundle Name..."

ORIGINAL_BUNDLE_NAME="$(/usr/libexec/PlistBuddy -c "Print :CFBundleName" "${info_plist_file}")"
echo " (i) Original Bundle Name: $ORIGINAL_BUNDLE_NAME"

/usr/libexec/PlistBuddy -c "Set :CFBundleName ${bundle_name}" "${info_plist_file}"

REPLACED_BUNDLE_NAME="$(/usr/libexec/PlistBuddy -c "Print :CFBundleName" "${info_plist_file}")"
echo " (i) Replaced Bundle Name: $REPLACED_BUNDLE_NAME"

# ==> Bundler Name patched in Info.plist file for iOS project


# ---- Set Info.plist Bundle Display Name:
echo ""
echo ""
echo " (i) Replacing Bundle Identifier..."

ORIGINAL_BUNDLE_DISPLAY_NAME="$(/usr/libexec/PlistBuddy -c "Print :CFBundleDisplayName" "${info_plist_file}")"
echo " (i) Original Bundle Display Name: $ORIGINAL_BUNDLE_DISPLAY_NAME"

/usr/libexec/PlistBuddy -c "Set :CFBundleDisplayName ${bundle_display_name}" "${info_plist_file}"

REPLACED_BUNDLE_DISPLAY_NAME="$(/usr/libexec/PlistBuddy -c "Print :CFBundleDisplayName" "${info_plist_file}")"
echo " (i) Replaced Bundle Display Name: $REPLACED_BUNDLE_DISPLAY_NAME"

# ==> Bundler Display Name patched in Info.plist file for iOS project

