#!/bin/bash

echo "1️⃣  Searching for Tuist..."
TUIST=$(which tuist)

if ! TUIST &> /dev/null
then
    echo "❌ Tuist not found"
    exit 1
else
    echo "✅ Found Tuist at $TUIST"
    echo ""
fi

# Clean Instructions

echo "2️⃣  Will delete folders 'Derived', 'DerivedData', 'ConqreteNamespace.xcodeproj', 'ConqreteNamespace.xcworkspace'"
rm -rf -f ./Derived ./DerivedData ./ConqreteNamespace.xcodeproj ./ConqreteNamespace.xcworkspace
echo "✅ Deleted folders 'Derived', 'DerivedData', 'ConqreteNamespace.xcodeproj', 'ConqreteNamespace.xcworkspace'"
echo ""

echo "3️⃣  Will clean tuist caches"
TUIST clean
echo "✅ Cleaned tuist caches"