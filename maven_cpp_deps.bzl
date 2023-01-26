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
static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

cc_library(
    name = "static_libs",
    srcs = static_srcs,
    visibility = ["//visibility:public"],
)

cc_library(
    name = "shared_libs",
    srcs = shared_srcs,
    visibility = ["//visibility:public"],
    deps = [
        ":static_libs",
    ]
)

cc_library(
    name = "shared_jni_libs",
    srcs = shared_jni_srcs,
    visibility = ["//visibility:public"],
)
"""

def __setup_bzlmodrio_opencv_cpp_dependencies(mctx):
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2022/opencv/opencv-cpp/4.5.2-1/opencv-cpp-4.5.2-1-headers.zip",
        sha256 = "cae9b4b5e31c15e9f7f0223b5ed7cc8c13dc3f4135c9002e8e73c7b7bf2fcf30",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2022/opencv/opencv-cpp/4.5.2-1/opencv-cpp-4.5.2-1-linuxathena.zip",
        sha256 = "92edb18cc8fb9872c6b2dd83f7c4b3fdb8353ab1807d1202b120063ec338f39a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2022/opencv/opencv-cpp/4.5.2-1/opencv-cpp-4.5.2-1-linuxathenastatic.zip",
        sha256 = "fb322dbdbd5f7aa6a9595c6be44cceadecd32be19aa59d381e6663c8bc1e5ddd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2022/opencv/opencv-cpp/4.5.2-1/opencv-cpp-4.5.2-1-linuxathenadebug.zip",
        sha256 = "44d97c3dce595b22df1951de51116247fcc5a6513a0d7e5095e3b549cb7a0851",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2022/opencv/opencv-cpp/4.5.2-1/opencv-cpp-4.5.2-1-linuxathenastaticdebug.zip",
        sha256 = "f91dec83b4c51d2ebc871b81abc2517e8fb1e0c30a798885a42e32e417dd2136",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxaarch64bionic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2022/opencv/opencv-cpp/4.5.2-1/opencv-cpp-4.5.2-1-linuxaarch64bionic.zip",
        sha256 = "9baf066738417fd31700b80d3ec586715888ccf36723d67f2ac6418be5c3f28c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxraspbian",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2022/opencv/opencv-cpp/4.5.2-1/opencv-cpp-4.5.2-1-linuxraspbian.zip",
        sha256 = "17c9cfcccf2599137adb0b1973d28580d102f55f21a4bc3f8c9673c2e4b3f3a6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2022/opencv/opencv-cpp/4.5.2-1/opencv-cpp-4.5.2-1-linuxx86-64.zip",
        sha256 = "f036f133d849dffed867b1ca235be85152ec25f3ec56fd412693390840fa5009",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2022/opencv/opencv-cpp/4.5.2-1/opencv-cpp-4.5.2-1-osxx86-64.zip",
        sha256 = "b0edd2df6dad473983d92fa0ea65aa8497a98f1ccbe04ab758c6910a1cda9958",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2022/opencv/opencv-cpp/4.5.2-1/opencv-cpp-4.5.2-1-windowsx86-64.zip",
        sha256 = "583bd691a28ad689f98ac9633c1e0a93847d66b3b31f310edf0f4615ac79b9dc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2022/opencv/opencv-cpp/4.5.2-1/opencv-cpp-4.5.2-1-windowsx86.zip",
        sha256 = "b3f443a407fd21159b17bb00535099a9930845a6e64a4dbd9d3ae1fd455d2f91",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxaarch64bionicstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2022/opencv/opencv-cpp/4.5.2-1/opencv-cpp-4.5.2-1-linuxaarch64bionicstatic.zip",
        sha256 = "922114478ee24e2a37e9137646f8bf5637313fd212866fd3c33f6c4ded32194e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxraspbianstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2022/opencv/opencv-cpp/4.5.2-1/opencv-cpp-4.5.2-1-linuxraspbianstatic.zip",
        sha256 = "ba852de5cb8bcc07568280f4bdb8963e72e86ed17c1549db3e954cca99887cae",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2022/opencv/opencv-cpp/4.5.2-1/opencv-cpp-4.5.2-1-linuxx86-64static.zip",
        sha256 = "7ed97fd12ec447136e7698267d7fd7537f7ef95e4b834f954b84de81fb9cc150",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2022/opencv/opencv-cpp/4.5.2-1/opencv-cpp-4.5.2-1-osxx86-64static.zip",
        sha256 = "c430e5b051541bbde5970246d10d780ddcd3f8a6025b7846f663572daba09e4d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2022/opencv/opencv-cpp/4.5.2-1/opencv-cpp-4.5.2-1-windowsx86-64static.zip",
        sha256 = "7cd401fdbdf7a55b06bcd891460f0858f3bc3ef0c81546036586981725ea4b25",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2022/opencv/opencv-cpp/4.5.2-1/opencv-cpp-4.5.2-1-windowsx86static.zip",
        sha256 = "ddd48255e29a538d71dd8e3a232c6bab012b4f74010836636cabd3e92631b90c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxaarch64bionicdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2022/opencv/opencv-cpp/4.5.2-1/opencv-cpp-4.5.2-1-linuxaarch64bionicdebug.zip",
        sha256 = "94da652d5a589c26602647302fbb248e9c8892525f4391bd07ac5c1b569b86b9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxraspbiandebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2022/opencv/opencv-cpp/4.5.2-1/opencv-cpp-4.5.2-1-linuxraspbiandebug.zip",
        sha256 = "1e168a104b122652a08666ba0399274efd750633dccb4506d59c5b07526e0296",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2022/opencv/opencv-cpp/4.5.2-1/opencv-cpp-4.5.2-1-linuxx86-64debug.zip",
        sha256 = "ae022cea66e346dbf1b482bcdb92da1ae03dcfbe5ca3ae03ee6eea04991b0d9f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2022/opencv/opencv-cpp/4.5.2-1/opencv-cpp-4.5.2-1-osxx86-64debug.zip",
        sha256 = "f984c514d24588e45c3333b8970a4bf2aba3a350580d47c84d19bb802f314c96",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2022/opencv/opencv-cpp/4.5.2-1/opencv-cpp-4.5.2-1-windowsx86-64debug.zip",
        sha256 = "036aac5b5615a46b1a01fa5f914e27ee4aa83067387521c85f7704572c957179",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2022/opencv/opencv-cpp/4.5.2-1/opencv-cpp-4.5.2-1-windowsx86debug.zip",
        sha256 = "90b5498ecbb91178cdec2c777c5d40030e0bbcd3783e3b170b43d4f85722c8eb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxaarch64bionicstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2022/opencv/opencv-cpp/4.5.2-1/opencv-cpp-4.5.2-1-linuxaarch64bionicstaticdebug.zip",
        sha256 = "4d72ba1ae152db2b7a5a38c3dbeb9007faa4bbeb49dfba6b2cee6e0bd5e558d5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxraspbianstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2022/opencv/opencv-cpp/4.5.2-1/opencv-cpp-4.5.2-1-linuxraspbianstaticdebug.zip",
        sha256 = "e2278d10970f850df4d5395182146d0566bd870d0c15b7f9301ac09fb18f11ec",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2022/opencv/opencv-cpp/4.5.2-1/opencv-cpp-4.5.2-1-linuxx86-64staticdebug.zip",
        sha256 = "30b0819bb702c90bb122b0bb203fe7d027dfb6dd830bc696d113eff4aa8dc958",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2022/opencv/opencv-cpp/4.5.2-1/opencv-cpp-4.5.2-1-osxx86-64staticdebug.zip",
        sha256 = "fd04add4c7c0d755aa9261778acde89f15a0b89804055d8eb45bcd698dec715f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2022/opencv/opencv-cpp/4.5.2-1/opencv-cpp-4.5.2-1-windowsx86-64staticdebug.zip",
        sha256 = "62860527d45a3dce266278300d58f7d19da56144ae4860c7caca68510c43ba53",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2022/opencv/opencv-cpp/4.5.2-1/opencv-cpp-4.5.2-1-windowsx86staticdebug.zip",
        sha256 = "1deedb825e14f8c7e9501331ee645a400810a6803f5bb16483fe3169a1f0ebe2",
        build_file_content = cc_library_static,
    )

def setup_legacy_bzlmodrio_opencv_cpp_dependencies():
    __setup_bzlmodrio_opencv_cpp_dependencies(None)

setup_bzlmodrio_opencv_cpp_dependencies = module_extension(
    __setup_bzlmodrio_opencv_cpp_dependencies,
)
