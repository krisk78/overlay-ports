#header-only library

#vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

message(STATUS "Version: v${VERSION}")

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "krisk78/requirements"
    REF "v${VERSION}"
    SHA512 "a8b74cb001a7c918a1b8a98a6646a8cca10dcc8d723dc67349b354cc9f18ca1257c644ee9143d5de04802314b925b9bfd795d09fe7525f7b0579bdd8f17ae128"
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
