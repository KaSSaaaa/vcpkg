vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO KaSSaaaa/gqlxy-core
    REF "v${VERSION}"
    SHA512 20e22674269c2a5195b093a71cb2c68dd0a09254fbacdc2020d6a8f6e22b0f587c935fbf363d3efd34843f73026a33bd3f981ea5240f5272d9808b69007d5c3f
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBUILD_TESTING=OFF
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME gqlxy-core CONFIG_PATH lib/cmake/gqlxy-core)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
