# Validate that $SPRING_VERSION conforms to the required pattern (e.g. 1.234.5)
echo $SPRINT_VERSION | grep -Pq '^\d+\.\d+\.\d+$' && \
    echo "Sprint version is valid." || \
    { echo "Sprint version does not match expected pattern."; exit 1; }

# Replaces the Version constant in ./version/version.go with $SPRINT_VERSION
cat > ./version/version.go << EOM
package version

const Version = "$SPRINT_VERSION"
EOM
