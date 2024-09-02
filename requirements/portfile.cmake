#header-only library

#vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

message(STATUS "Version: v${VERSION}")

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "krisk78/requirements"
    HEAD_REF "master"
    REF "v${VERSION}"
    SHA512 "7adad5ec39cf724c77fdb9698ce5f1837ead4bab33d04f8c604d2a8ccf3bc80e93a0577018f40715fe9620fa1dc1588655cc029454abe01154800e544594f530"
)

message(STATUS "Source path: ${SOURCE_PATH}")

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -Drequirements_BUILD_TESTS=OFF
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
