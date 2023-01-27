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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-headers.zip",
        sha256 = "69c9693c87c620d4b07b93f322f21e813ba9ce0ad16604709c8b373774422736",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-sources.zip",
        sha256 = "f991b70e136fa13394de8589e19009f51ce0a548d38bd79b01428e2c9258a9b1",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-linuxathena.zip",
        sha256 = "48b2156fb4cdfca85e60c1dd9d033951230beb2f15e743170a2bec35b8f3f634",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-linuxathenastatic.zip",
        sha256 = "e5675776e53fa2d4ab1a4058e014f661726ce09663d54806e52e797d074daaff",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-linuxathenadebug.zip",
        sha256 = "4486186e52854ef3249d9acac522122a620011dd1b46b5486d77f847af93d7b3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-linuxathenastaticdebug.zip",
        sha256 = "5e206cfed8888bbcebfcd39aedcdbee05a90fb313656c8e6d8865c61cc32b1dd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-linuxarm32.zip",
        sha256 = "2103e504a9153243d2c918b6f59156a6c2b3cfd9a95b65b90ae462fe3787c06a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-linuxarm64.zip",
        sha256 = "f9790ed76e5b489491575743a01a60a1049c9705f66a311b829bbd030234faa3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-linuxx86-64.zip",
        sha256 = "1024fa62ad0b6b894c37ad92142061fc8c7dffcebae3d6076c871a25475f9486",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-osxarm64.zip",
        sha256 = "4451cc0f596ed6d70a9b350de9462c69e42b9554ada3412a8e30bfc900ec45b0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-osxuniversal.zip",
        sha256 = "4cf8bbf6760bebf474bee18a57d40e9d83c6888bac1abe1669116cc603b01e5b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-osxx86-64.zip",
        sha256 = "edcb7e2c6b8088b770ca9ec050ed37ac2d0c89f22e5145c0b8ad7aea3a8bb22a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-windowsx86-64.zip",
        sha256 = "2ecc2a6df340f524259d77d3f419c09baa6310aba681c63a081749f18df6aee4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-windowsx86.zip",
        sha256 = "53f6ab08c876a8832281847367421af23bcb805130839df3f26ab09880be8808",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-linuxarm32static.zip",
        sha256 = "e4bfb01cd88c38d3dd3eefee85893b60b5e99625d083e69ed4fd67898dd4b298",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-linuxarm64static.zip",
        sha256 = "c3a2d05abfcc1132ae4ff7c2e175adea95b0843f59e775ad24d8a6ae0e320f4e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-linuxx86-64static.zip",
        sha256 = "58798265cdeae2f237d4b018f3cc1fdaa4557bbfd0a09503e069f0eae93c6b62",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-osxarm64static.zip",
        sha256 = "6f473c6c0bf00c8209722a808a143afc7f654ca88ea56025719fa88988ec70d3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-osxuniversalstatic.zip",
        sha256 = "342405818d0f0a0d6528c0385ddd268805d36854d1e895c608d5b6953d2da0f1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-osxx86-64static.zip",
        sha256 = "bebac3367bb9b3b24c3b76e98514f09ae4c109581f2df8da5233ab95b0118c3f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-windowsx86-64static.zip",
        sha256 = "9b97f5d3894e80c27758782d1d71cfc7c641021f79d83a481e3faa70a13bff21",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-windowsx86static.zip",
        sha256 = "60b7f324c29c3d0d11bca3c56c7c1077683c10fdbf1cc5afe02114601007972e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-linuxarm32debug.zip",
        sha256 = "c86483fba67e78ab868acf95ca5183754b5f546fe1c5665a9306d61007052c8d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-linuxarm64debug.zip",
        sha256 = "e40c893a6fe69ae5d6784bbe428f810db5c4a40754f2485e5b5ec74d95567d66",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-linuxx86-64debug.zip",
        sha256 = "0956493a063d4a4ffb2b6cfdb0611554e24862eb4efe74df6c53ad1450ff1668",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-osxarm64debug.zip",
        sha256 = "4883fce97b97a5dbbeef417427e7e40bfd3f0e5eb9f8597653916f9f5bf1c1cc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-osxuniversaldebug.zip",
        sha256 = "bccc8a0b5c695d077ba04aa90d35f2f43607c2424df11824f960a37d718b35ee",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-osxx86-64debug.zip",
        sha256 = "2427d5162771391337a0924ddb6c99e092c7f2705116b72a7907b3f7305be6de",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-windowsx86-64debug.zip",
        sha256 = "a367c0c53f01666b5894aa44016f27d132f36764617374fe550836b06bffbb83",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-windowsx86debug.zip",
        sha256 = "52de048fc90b70293f5161983a692b1372110dd1b004be5f865d4239a6423156",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-linuxarm32staticdebug.zip",
        sha256 = "f72bf5f9ab5ed525951169320c67356885e80485b7657d17b9894f630730adec",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-linuxarm64staticdebug.zip",
        sha256 = "30c72879a0c7ce046732d2d794a21ba60b09bb71c2d57e6192af90c8aab08fdf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-linuxx86-64staticdebug.zip",
        sha256 = "3af477003ec993aa9a20308a4e1030f097a34552640440b5c66ef9d554a297bd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-osxarm64staticdebug.zip",
        sha256 = "53331ca83dbc862a1fffbe0b4a1cebcbb59f055d202a236b2641d7203beefcd9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-osxuniversalstaticdebug.zip",
        sha256 = "4be1972406a676b184ca527a92bf8e72c19e58e14d6acd3a93e067c92ca6aeb5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-osxx86-64staticdebug.zip",
        sha256 = "b00ff2fe09191b141fc9fc3079c5c5d0132f783671135ccce9f5cf1353d72380",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-windowsx86-64staticdebug.zip",
        sha256 = "5ec11ce7a8ebb510b21a8325b19059da9011c6f48abfe587be0b298a6d4c7652",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-4/opencv-cpp-4.6.0-4-windowsx86staticdebug.zip",
        sha256 = "3569e9bcf51bcf4e15761dd08ea35de11263ea4e091fd38c43eae49a2d22e2f4",
        build_file_content = cc_library_static,
    )

def setup_legacy_bzlmodrio_opencv_cpp_dependencies():
    __setup_bzlmodrio_opencv_cpp_dependencies(None)

setup_bzlmodrio_opencv_cpp_dependencies = module_extension(
    __setup_bzlmodrio_opencv_cpp_dependencies,
)
