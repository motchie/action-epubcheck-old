#!/bin/sh -l

# Set default EPUBCHECK_DIR
EPUBCHECK_DIR="/usr/src/app/epubcheck"

# Run epubcheck with the provided options from GitHub Actions environment variable
EPUBCHECK_CMD="java -jar ${EPUBCHECK_DIR}/epubcheck-${EPUBCHECK_VERSION}/epubcheck.jar"

# Function to add an option
add_option() {
  local option=$1
  local value=$2
  if [ -n "$value" ]; then
    EPUBCHECK_CMD="${EPUBCHECK_CMD} ${option} ${value}"
  fi
}

# Add options here
add_option "--mode" "$EPUBCHECK_MODE"
add_option "--save" "$EPUBCHECK_SAVE"
add_option "--profile" "$EPUBCHECK_PROFILE"
add_option "--output" "$EPUBCHECK_OUTPUT"
add_option "--json" "$EPUBCHECK_JSON"
add_option "--xmp" "$EPUBCHECK_XMP"
add_option "--failonwarnings" "$EPUBCHECK_FAILONWARNINGS"
add_option "--quiet" "$EPUBCHECK_QUIET"
add_option "--fatal" "$EPUBCHECK_FATAL"
add_option "--error" "$EPUBCHECK_ERROR"
add_option "--warn" "$EPUBCHECK_WARN"
add_option "--usage" "$EPUBCHECK_USAGE"
add_option "--locale" "$EPUBCHECK_LOCALE"
add_option "--listChecks" "$EPUBCHECK_LISTCHECKS"
add_option "--customMessages" "$EPUBCHECK_CUSTOMMESSAGES"

# Execute the command
eval $EPUBCHECK_CMD