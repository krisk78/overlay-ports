#header-only library

#vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

message(STATUS "Version: v${VERSION}")

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "krisk78/conflicts"
    REF "v${VERSION}"
    SHA512 "d24c178531d9dcd16e72dd8051edde5a0e2f1893dd3d7f00ccd2ca5eb0653f66a460a5fa9083459131d4ec3676ed059505dfb7e2d3d352f6e8a05e5f8e99ffba"
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
