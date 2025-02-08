#!/bin/sh
# ----------------------------------------------------------------------------
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Apache Maven Wrapper startup batch script, version 3.2.0
#
# Required ENV vars:
# ------------------
#   JAVA_HOME - location of a JDK home dir
#
# Optional ENV vars
# -----------------
#   MAVEN_OPTS - parameters passed to the Java VM when running Maven
#     e.g. to debug Maven itself, use
#       set MAVEN_OPTS=-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=8000
#   MAVEN_SKIP_RC - flag to disable loading of mavenrc files
# ----------------------------------------------------------------------------

if [ -z "$MAVEN_SKIP_RC" ] ; then

  if [ -f /usr/local/etc/mavenrc ] ; then
    . /usr/local/etc/mavenrc
  fi

  if [ -f /etc/mavenrc ] ; then
    . /etc/mavenrc
  fi

  if [ -f "$HOME/.mavenrc" ] ; then
    . "$HOME/.mavenrc"
  fi

fi

# OS specific support.  $var _must_ be set to either true or false.
cdf_os="unknown"
cdf_uname="$( uname -s )"
case "$cdf_uname" in
  CYGWIN*) cdf_os="windows" ;;
  MINGW*) cdf_os="windows" ;;
  MSYS*) cdf_os="windows" ;;
  Windows_NT*) cdf_os="windows" ;;
  Darwin*) cdf_os="darwin" ;;
  *) cdf_os="$( uname -s | tr '[:upper:]' '[:lower:]' )" ;;
esac

# For Cygwin, ensure paths are in UNIX format before anything is touched
if [ "$cdf_os" = "windows" ] ; then
  [ -n "$JAVA_HOME" ] &&
    JAVA_HOME="$( cdf_os_path "$JAVA_HOME" )"
  [ -n "$CLASSPATH" ] &&
    CLASSPATH="$( cdf_os_path "$CLASSPATH" )"
  [ -n "$MAVEN_HOME" ] &&
    MAVEN_HOME="$( cdf_os_path "$MAVEN_HOME" )"

  # TODO classpath??
fi

# Provide a "standardized" way to retrieve the CLI args that will
# work with both Windows and non-Windows executions.
MAVEN_CMD_LINE_ARGS="$MAVEN_CONFIG $@"
export MAVEN_CMD_LINE_ARGS

HELP_HELP="$( printf -- '%s
%s
%s
%s' \
  'Apache Maven Wrapper version 3.2.0' \
  '' \
  'Usage: mvnw [options] [<goal(s)>] [<phase(s)>]' \
  '' )"

WRAPPER_LAUNCHER=org.apache.maven.wrapper.MavenWrapperMain

# shellcheck disable=SC2086 # safe args
exec "$JAVACMD" \
  $MAVEN_OPTS \
  $MAVEN_DEBUG_OPTS \
  -classpath "$MAVEN_PROJECTBASEDIR/.mvn/wrapper/maven-wrapper.jar" \
  "-Dmaven.multiModuleProjectDirectory=${MAVEN_PROJECTBASEDIR}" \
  ${WRAPPER_LAUNCHER} $MAVEN_CONFIG "$@"