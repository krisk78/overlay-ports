#header-only library

#vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

message(STATUS "Version: v${VERSION}")

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "krisk78/conflicts"
    HEAD_REF "master"
    REF "v${VERSION}"
    SHA512 "9ec377b18bcc022ec431586e9f753ec85258defbbadc3e6d7b8531b1f1e7d1eb1d238f25dd2d49c79e3ea6002433fe35e8893c3e2b1ceb61c2ddec72b960c843"
)

message(STATUS "Source path: ${SOURCE_PATH}")

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -Dconflicts_BUILD_TESTS=OFF
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
