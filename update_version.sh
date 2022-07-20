# Replaces the Version constant in ./version/version.go with $SPRINT_VERSION
cat > ./version/version.go << EOM
package version

const Version = "$SPRINT_VERSION"
EOM
