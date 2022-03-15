# Ansible Role: Installs Java 11 Open JDK

## Requirements

None.

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

    force_java_install: False

Force to install Java on already installed system.

    java_installer_force_overwrite: False

Force to overwrite Java installer.

    java_installer_keep: False

Do not delete Java installer.

    java_installer_local: False

Install local (form Ansible host) JDK/Server JRE instead of downloading on target machine.

    java_type: jdk

Type of Java installer - JDK is: jdk, and Server JRE is: serverjre

    java_version: 11

Java major version.

    java_update: 0

Java minor version.

    java_build: "10"

Java micro version.

    java_platform: linux-x64

Java platform to install.

    java_bins: [ 'javah', 'javap', 'jmap', 'extcheck', 'pack200', 'jrunscript', 'jinfo', 'jcontrol', 'jmc', 'keytool', 'schemagen', 'jjs', 'jvisualvm', 'policytool', 'rmid', 'wsgen', 'javaws', 'javadoc']

Update alternatives on these binaries.

    java_bins_priority: 9

Alternatives priority on these binaries.

    java_usr_folder: /usr/java

Location of installed Java home.

    java_latest_folder: /usr/java/latest

Where to link the latest folder.

    java_download_base_url: https://download.java.net/java/ga/

Download link of Java installers.

## Dependencies

None.

## Example Playbook

    - hosts: all
      roles:
        - java-open-jdk11

