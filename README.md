# overlay-ports
VCPKG overlay ports used for import libraries:
* str-utils-static
* date-utils-static
* file-utils-static
* requirements
* conflicts
* consoleapp-static

Update installation path in the vcpkg-configuration.json file of your project, ie:
"overlay-ports": [ "../overlay-ports" ]
