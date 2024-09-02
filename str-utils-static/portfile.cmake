#static library

vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

message(STATUS "Version: v${VERSION}")

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "krisk78/str-utils-static"
    HEAD_REF "master"
    REF "v${VERSION}"
    SHA512 "611723d13f8a812cd78da0afd1387c8a5a9440636a851fcf4809399c09ccef1c98712a602f15292a6edc7b8885110f599cc5587e428692a57c1019244619a9d9"
)

message(STATUS "Source path: ${SOURCE_PATH}")

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -Dstr-utils-static_BUILD_TESTS=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup()

# Remove redundant files
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include" "${CURRENT_PACKAGES_DIR}/debug/share")

file(
    INSTALL "${SOURCE_PATH}/LICENSE.txt"
    DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
    RENAME copyright
)

configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)
