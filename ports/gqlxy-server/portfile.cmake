vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO KaSSaaaa/gqlxy-server
    REF "v${VERSION}"
    SHA512 0a3da91ed684cdd91d0f0c086458a6c7adff6a201ed35008fa70311ca7dc808fab50d182e31031cd006a8a9665047f329a4265838dfd7276244eb96fa97d7a51
    HEAD_REF main
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        standalone-server BUILD_STANDALONE_SERVER
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBUILD_TESTING=OFF
        ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME gqlxy-server CONFIG_PATH lib/cmake/gqlxy-server)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
