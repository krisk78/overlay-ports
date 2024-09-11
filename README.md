# overlay-ports
VCPKG overlay ports used to import libraries:
* str-utils-static
* date-utils-static
* file-utils-static
* requirements
* conflicts
* usage-static
* consoleapp-static

Update installation path in the vcpkg-configuration.json file of your project, ie:
"overlay-ports": [ "../overlay-ports" ]
