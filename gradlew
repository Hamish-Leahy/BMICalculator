#!/usr/bin/env sh

# Copyright 2015 ... (Original copyright notice)

##############################################################################
## Gradle Startup Script for UN*X 
##############################################################################

# Set environment variables
# Find the actual location of the script (resolve symlinks)
PRG="$0"
while [ -h "$PRG" ] ; do
  # ... (Symlink resolution logic)
done
SAVED="`pwd`" # Save the current directory
cd "`dirname "$PRG"`/" >/dev/null # Change to script's directory
APP_HOME="`pwd -P`" # Get the absolute path of the script's directory
cd "$SAVED" >/dev/null # Go back to the original directory

# Basic app information
APP_NAME="Gradle"
APP_BASE_NAME=`basename "$0"`

# Default JVM options (can be overridden by JAVA_OPTS and GRADLE_OPTS)
DEFAULT_JVM_OPTS='"-Xmx64m" "-Xms64m"'

# Max file descriptors (try to use the maximum available)
MAX_FD="maximum"

# Helper functions
warn () { echo "$*" ; }  # Print warning messages
die () { echo "$*" ; exit 1; } # Print error message and exit

# Check OS type (Cygwin, Darwin (macOS), MSYS, NonStop)
cygwin=false
# ... (OS detection logic)

# Set Gradle wrapper classpath
CLASSPATH=$APP_HOME/gradle/wrapper/gradle-wrapper.jar

# Find Java executable based on JAVA_HOME (or use 'java' if not set)
if [ -n "$JAVA_HOME" ] ; then
  # ... (Find Java in JAVA_HOME)
else
  JAVACMD="java"
  which java >/dev/null 2>&1 || die "ERROR: JAVA_HOME is not set and no 'java' command could be found..." 
fi

# Increase maximum file descriptors if possible (not on Cygwin, Darwin, or NonStop)
if [ "$cygwin" = "false" -a "$darwin" = "false" -a "$nonstop" = "false" ] ; then
  # ... (Increase file descriptor limit logic)
fi

# Add macOS-specific options for dock appearance
if $darwin; then
  GRADLE_OPTS="$GRADLE_OPTS \"-Xdock:name=$APP_NAME\" \"-Xdock:icon=$APP_HOME/media/gradle.icns\""
fi

# Convert paths to Windows format for Cygwin/MSYS
if [ "$cygwin" = "true" -o "$msys" = "true" ] ; then
  # ... (Path conversion logic)
fi

# Escape arguments to be passed to Java
save () {
  # ... (Argument escaping logic)
}
APP_ARGS=`save "$@"`

# Construct the Java command with all options and arguments
eval set -- $DEFAULT_JVM_OPTS $JAVA_OPTS $GRADLE_OPTS "\"-Dorg.gradle.appname=$APP_BASE_NAME\"" -classpath "\"$CLASSPATH\"" org.gradle.wrapper.GradleWrapperMain "$APP_ARGS"

# Execute the Java command to start Gradle
exec "$JAVACMD" "$@"


exec "$JAVACMD" "$@"
