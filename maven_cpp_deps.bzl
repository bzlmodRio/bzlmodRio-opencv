load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

filegroup_all = """filegroup(
     name = "all",
     srcs = glob(["**"]),
     visibility = ["//visibility:public"],
 )
 """

cc_library_headers = """cc_library(
    name = "headers",
    hdrs = glob(["**"]),
    includes = ["."],
    visibility = ["//visibility:public"],
)
"""

cc_library_sources = """filegroup(
     name = "sources",
     srcs = glob(["**"]),
     visibility = ["//visibility:public"],
 )
 """

cc_library_static = """

cc_library(
    name = "static_libs",
    srcs = glob(["**/*.lib", "**/*.a"]),
    visibility = ["//visibility:public"],
)
"""

cc_library_shared = """
JNI_PATTERN=[
    "**/*jni.dll",
    "**/*jni.so*",
    "**/*jni.dylib",
    "**/*_java*.dll",
    "**/lib*_java*.dylib",
    "**/lib*_java*.so",
]

static_srcs = glob([
        "**/*.lib",
        "**/*.a"
    ],
    exclude=["**/*jni.lib"]
)
shared_srcs = glob([
        "**/*.dll",
        "**/*.so*",
        "**/*.dylib",
    ],
    exclude=JNI_PATTERN + ["**/*.so.debug"]
)
shared_jni_srcs = glob(JNI_PATTERN, exclude=["**/*.so.debug"])

filegroup(
    name = "static_libs",
    srcs = static_srcs,
    visibility = ["//visibility:public"],
)

filegroup(
    name = "shared_libs",
    srcs = shared_srcs,
    visibility = ["//visibility:public"],
)

filegroup(
    name = "shared_jni_libs",
    srcs = shared_jni_srcs,
    visibility = ["//visibility:public"],
)
"""

def __setup_bzlmodrio_opencv_cpp_dependencies(mctx):
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-headers.zip",
        sha256 = "531c3dcb371c08f9c93731c5b19cd1fafe21f9ddc7b5e1be90c88eb210026322",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-sources.zip",
        sha256 = "a097d0713881352fc9ad2573199deb121fbe8b88a986ceae992a757e3b4aefbd",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-linuxathena.zip",
        sha256 = "779dfa0037054158e64582294c03c78e96fa17c4e0ef25c9dc37612788d99824",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-linuxathenastatic.zip",
        sha256 = "95b26ec35e43fcfb35460045169a1c0ba96aba62b2647780c615a3b4d9064573",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-linuxathenadebug.zip",
        sha256 = "f631987a544d1c9abe59e8289e2b96702fbc4a4206e74e5338f8b237c4435b03",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-linuxathenastaticdebug.zip",
        sha256 = "9e3b5c835169d3c68ee502d987ba522856790a7d6324f49b83141481c47b7d6b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-linuxarm32.zip",
        sha256 = "a55c4d8703c5e0ba5ac5ce61d959f1b0637100a9a90e0a61ec5945eedb130d9a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-linuxarm64.zip",
        sha256 = "c252559a19b92f49c8380964ccc99534053c0249fa7a624c2273d0f0cc52a7d7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-linuxx86-64.zip",
        sha256 = "65460c7752c598edc10ffd27d765646ca38daf8e7cbfe9632ed3185fd3b92af5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-osxarm64.zip",
        sha256 = "9cdeb1a2f16931ab374ce43964dd8980ca3cf127ddfc3253e8c80936b6ff97ab",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-osxuniversal.zip",
        sha256 = "6fb43565bd012b6af4cf2a662909ad31d186c5b8eefc53141f01b2d1e62365d4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-windowsx86-64.zip",
        sha256 = "53972f8c5af5b5f2b6448474fdf351a54248fbe8fc1eb7cb9358ad27a2d18204",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-windowsx86.zip",
        sha256 = "5d77f70061b77cdca1ba9c052ebab834865aec48b940be67e0f760cd5a44c888",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-windowsarm64.zip",
        sha256 = "4fa314723c4361aafed41beb4638c7641052b35f9acd71109352cb939e113fd0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-linuxarm32static.zip",
        sha256 = "06a969de8c0c88cdd3111d0c0a82d6a235c2b58884a85c776a238cd8fe065120",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-linuxarm64static.zip",
        sha256 = "57a76ac3a3909523127db6438bd2a269cf9df402e94f69acac562022c38412ab",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-linuxx86-64static.zip",
        sha256 = "56900bd7cb5c47d035784fc6e10613333fba3e24082a82c6a50fd44fee489b46",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-osxarm64static.zip",
        sha256 = "73bd23897409fd9f67010f9ec1a0e1c9a3de7919f1df1d84205688fc24c0a1bb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-osxuniversalstatic.zip",
        sha256 = "2cea3f05b1c0da424ef5ecd1ce3bebede955125ad7c087dc868ab9ffcefab439",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-windowsx86-64static.zip",
        sha256 = "dc72d597ee080c95449cfabf9f8eaa8247a853d5a05335e8178198ef14375dc5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-windowsx86static.zip",
        sha256 = "39f30d102629982dc2094be50b83fb64c3435dd616931146d65ded525462b954",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-windowsarm64static.zip",
        sha256 = "a7d12026a387b944170c0d0d975c5e4811ae1cb2c653ca907a16dade9c27d636",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-linuxarm32debug.zip",
        sha256 = "044691a98eb56b8d5d9c78a5bec4ec4808dfb4780d6f33621599989c5ab5af4d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-linuxarm64debug.zip",
        sha256 = "fd5063af8c57619d0014381de574a992837bffe657660b2ae89c76c2d9e4667e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-linuxx86-64debug.zip",
        sha256 = "80e96c690e0edd0e0bbd9675ebc4c3d466511c71f8fbe9cc5e1c973f588de6b1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-osxarm64debug.zip",
        sha256 = "34e734264df5cd5e5ac6272b4a1853860f39dfe5de1259e536341daed5f4130a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-osxuniversaldebug.zip",
        sha256 = "d9ce98fe382b3144c1798a93ce41155097bffe865975df6fbc1750f0499d5a5c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-windowsx86-64debug.zip",
        sha256 = "95a1809d9fc84b9ae77783dd19ecb8162839cdc2bca61e196f92e76b319f6769",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-windowsx86debug.zip",
        sha256 = "9145589f4d3dbf79431f1fe5acab8bc4177ce4b11dd2a089ec620d4756c687d3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-windowsarm64debug.zip",
        sha256 = "d74ed4ab86fb09114e112fa9f1128d4d73f7a025eb4960f80185b1a446d85050",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-linuxarm32staticdebug.zip",
        sha256 = "b531e2f183c6448d57dee3ab45e09485d9f28509e7561f68b986df921718a8e8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-linuxarm64staticdebug.zip",
        sha256 = "8aa68374f8cf2986db7fabd6689422f2de186071b58442f1c931ea142ab7ca97",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-linuxx86-64staticdebug.zip",
        sha256 = "4bdb864022e6c236c820749e1727edd21304bf66080399f0564e2fb38bb15734",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-osxarm64staticdebug.zip",
        sha256 = "f0a0d7e2dd979167bc26afcbadf74c65380c928a362d8e380285813a3716bfb8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-osxuniversalstaticdebug.zip",
        sha256 = "ffa2ef5df42f7b1f6de102a7d5669cf5e6aba425cd0eea07b616f08f15ab06de",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-windowsx86-64staticdebug.zip",
        sha256 = "2ca9516f1f677a07b55990ecfa9679f53d8ab656f6435d24a3e5e7189ed808b8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-windowsx86staticdebug.zip",
        sha256 = "6f3516a72d00c2cfbfec2456d8dbd8b8356dca4d475dd5d0be2ef70714e513df",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-1/opencv-cpp-4.8.0-1-windowsarm64staticdebug.zip",
        sha256 = "a1533d636aca245f083e425c3535207433a339dbf4bbdf7e3b8e482abc9df52b",
        build_file_content = cc_library_static,
    )

def setup_legacy_bzlmodrio_opencv_cpp_dependencies():
    __setup_bzlmodrio_opencv_cpp_dependencies(None)

setup_bzlmodrio_opencv_cpp_dependencies = module_extension(
    __setup_bzlmodrio_opencv_cpp_dependencies,
)
