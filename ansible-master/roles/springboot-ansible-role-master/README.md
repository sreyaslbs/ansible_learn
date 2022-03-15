Ansible Spring Boot role
=========

Ansible role to install and run a Spring Boot application on linux servers.

Features:
- downloads and unpackage the chosen JRE or JDK
- creates a dedicated user and group on the server
- creates a systemd file to run and restart the application 
- downloads the executable jar or wars from a maven repository or copy from local machine
- checks if the app has restarted correctly

The following directory structure will be created on the target machine:

```
ansibledemo/
|-- app.jar
|-- config
|   |-- application.properties
|   `-- logback-spring.xml
|-- logs
|   `-- app.log
`-- readme.info
```


Role Variables
--------------
| Variables | Required | Default value | Description |
|-----------|----------|---------------|-------------|
| sb_create_user_group  | false     | *true*          | Flag to enable user/group creation |
| sb_user  | true     | *None*          | User |
| sb_group  | true     | *None*          | Group |
| sb_configuration_files  | false     | *None*          | List of .j2 configuration files that will be copied in the `config/` dir of the target server. The name of files into list must be without suffix .j2. Insert this files in the `templates/` dir of your project. |
| sb_app_group_id  | true     | *None*          | Maven group id |
| sb_app_artifact_id  | true     | *None*          | Maven artifact id |
| sb_app_service_name  | false     | *None*          | Service name (default: read from artifact id) |
| sb_app_version  | true     | *None*          | Application version |
| sb_app_extension  | false     | *jar*          | Artifact file extension |
| sb_app_info_urls  | false     | *None*          | Healtcheck urls. If defined , healtcheck task will be executed. |
| sb_app_healthcheck_retry_count  | false     | 10         | Number of attempts to check if the application has been started. |
| sb_app_healthcheck_retry_delay  | false     | 6          | Delay between requests to check application health. |
| sb_app_install_java  | true     | true          | whether to install java or not |
| sb_app_java_remote_repo  | true     | https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.10%2B9/OpenJDK11U-jre_x64_linux_hotspot_11.0.10_9.tar.gz          | AdoptOpenJDKURL |
| sb_app_java_version  | false     | 11.0.10          | The java version (used to create a directory) |
| sb_app_java_base_dir  | false     | '/usr/lib/jre-{{ sb_app_java_version }}'          | Java Installation directory |
| sb_app_java_opts_xms  | false     | *256M*          | XMS arg value. |
| sb_app_java_opts_xmx  | false     | *1024M*          | XMX arg value. |
| sb_app_java_opts_others  | false     | *None*          | List of other opts. (- spring.profiles.active=prod) |
| sb_app_maven_repo  | true     | *None*          | Maven repository url. |
| sb_app_maven_user  | true     | *None*          | Maven repository user. |
| sb_app_maven_password  | true     | *None*          | Maven repository password |
| sb_app_maven_local_download | false | *false* | Artifact will be downloaded locally first and then copied to remote host |
| sb_app_maven_download: false | if true download from maven repo
| sb_app_local_present: true | if jar present in local machine
| sb_app_folder: /etc/ansible/jar | path of jar in local machine
| sb_application_dir  | true     | *None*          | Root application dir |
| sb_application_conf_dir  | false     | *{{ sb_application_dir }}/config*          | Configuration dir |
| sb_application_logs_dir  | false     | *{{ sb_application_dir }}/logs*          | Logs dir |
|-----------|----------|---------------|-------------|


Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Install Spring Boot application from the remote maven repository.

---
- hosts: localhost
  roles:
    - role: springboot-ansible-role-master    
```

