# Validate that $SPRINT_VERSION_WITH_PATCH conforms to the required pattern (e.g. 1.234.5)
echo $SPRINT_VERSION_WITH_PATCH | grep -Pq '^\d+\.\d+\.\d+$' && \
    echo "Sprint version is valid." || \
    { echo "Sprint version does not match expected pattern."; exit 1; }

# Replaces the Version constant in ./version/version.go with $SPRINT_VERSION_WITH_PATCH
cat > ./submodule/version/version.go << EOM
package version

const Version = "$SPRINT_VERSION_WITH_PATCH"
EOM
