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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-headers.zip",
        sha256 = "2530b606752365067a59326c3fe8e9648362254247d1bfce668598558a14c351",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-sources.zip",
        sha256 = "f0e0c09eb24209477238cb635b177f668741a20d12fc5ed2d19b14ebbdf88eed",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-linuxathena.zip",
        sha256 = "518d6784eea3960bfade28baef66888a5ecbeeda8b424ca6ebbdfb9bd69b5bdc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-linuxathenastatic.zip",
        sha256 = "52437b5f77fafea31c0a14b3783a71cc7ed95146ce6431d44e80a53a4457ec58",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-linuxathenadebug.zip",
        sha256 = "428b9f35c72f869f70360e74187fbb9a899a859c25d40acf3adc65f448079077",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-linuxathenastaticdebug.zip",
        sha256 = "62c9a1146189cddca666b59f2456d60b925ef4955c8caee342728ead0400a5f2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-linuxarm32.zip",
        sha256 = "0090a4c872ef67c269fe239cf4f88c8bfcabe33b697ecf04c8847160f40da200",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-linuxarm64.zip",
        sha256 = "8e2553446e23ac4bb53b29bc3442c8ac33db7ae217093c119b5229f6bbe0b3e1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-linuxx86-64.zip",
        sha256 = "7bb879bf247fcf720cda759bbe1624ccb5bca9d338d5697d49487fb965e0aa77",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-osxarm64.zip",
        sha256 = "4dcf750a6e7d1ec2452275e9d03ee6a7d06a3b61b8cc2be279f25cff50f60636",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-osxuniversal.zip",
        sha256 = "d9a4054568cd02af35915d6dd72c4d0e883fc093b7ce22f780aed7dbc402b6b8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-windowsx86-64.zip",
        sha256 = "198585b4787409eaa18f0f1c12d02defd307ccc0ccd7310c37b10c756aa65ae0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-windowsx86.zip",
        sha256 = "d741e03ff1c5fca57f6a3cb50cea2fa5cda1f61d6ea50d87e606f1e718bc8cbe",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-windowsarm64.zip",
        sha256 = "53efc7eff9f07303143c20c6a97a99d4fdbc6fd5d94d7bfa0abf2b9c0f3c463f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-linuxarm32static.zip",
        sha256 = "6f5fcf8e0e23ba270fdef283440df57bda5a647a221829838a6aabc5d2364bba",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-linuxarm64static.zip",
        sha256 = "c4761548f43525bfb47d900513ccfc255dda4ca752cf7630ec794e1d8d9f1183",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-linuxx86-64static.zip",
        sha256 = "7e6787c1464b7244424ddd2136c932bd44f00cae03eb1cc5568559ec2306aa30",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-osxarm64static.zip",
        sha256 = "169c92c95e6f1945c45ca33a88e53d0e79f9e931ae663667507b5fadc850f9d8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-osxuniversalstatic.zip",
        sha256 = "2e601e3c676de93a0be317ca6f3021054a7a0e0d0a645a652ce90a771c38d752",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-windowsx86-64static.zip",
        sha256 = "d2b827528560ee28838f50fe10d0f083ec6fcb5b15710e0216a487d2372ef7d1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-windowsx86static.zip",
        sha256 = "e01ef6e79aea79fbd16928bd85819bfb8d45113500e1d94674a0cf8aa7b0a90b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-windowsarm64static.zip",
        sha256 = "c14ee3cc500f6dca254e4ea49a160ead5374e2b40293782d5f644a6f88741aaa",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-linuxarm32debug.zip",
        sha256 = "203c369164c81774948fbf2750118c39cd511534fc823a901564152e6a354e7e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-linuxarm64debug.zip",
        sha256 = "0f7ce021fdcb973ea906345404439ec422bfd5fdab4e149022389d87bcdf1d95",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-linuxx86-64debug.zip",
        sha256 = "14da1ec987f30e98204a5cf3745b3403fac4a38e12e3a4ec0343343ae495aaf7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-osxarm64debug.zip",
        sha256 = "f32be064ca51a631f8c78802af2fa2a3acebcdb67351e6d1bbd1a4b757089711",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-osxuniversaldebug.zip",
        sha256 = "1acb0769e1a9e753e3d82ee0e3d09653adda61f0ee6039fa29460d08ea44959f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-windowsx86-64debug.zip",
        sha256 = "849003fec2f287382043b96f0cc92ae51cc27fe2838dd75665abab98aa9a1d7b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-windowsx86debug.zip",
        sha256 = "79036d599eea7aba2f0d3d73515b0041046b0d433a540cc17b99ac4be5bca50b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-windowsarm64debug.zip",
        sha256 = "3983778fc4b618bf4f7cd84f881fdebfd4c90007c56f90f2307750f6cecfcf8d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-linuxarm32staticdebug.zip",
        sha256 = "f40d92d225c58536c7d680c620d711c26ab8a96ada81c0d2b260fc10635ffad0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-linuxarm64staticdebug.zip",
        sha256 = "84fabb01930b54d4b3c55fb1f841c0edd6b860161599fa54396aa9a980cb78d8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-linuxx86-64staticdebug.zip",
        sha256 = "b357ea839a31e1346e3a499eaaca0d7ad5cf13c8a22a0b3a4d105e3e21f165f1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-osxarm64staticdebug.zip",
        sha256 = "383749cb003db028483acbddc2d1eadb93cb553a7ff932d3e83a93ef53530115",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-osxuniversalstaticdebug.zip",
        sha256 = "4ee15c9e7bae3fba200d1aa6ef1f515c34a86205cad60c519772d0d8a0d76064",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-windowsx86-64staticdebug.zip",
        sha256 = "589c7c50bfe949a264b0d51e2f7ca1406264071c1955e205cb89f948d6f18b75",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-windowsx86staticdebug.zip",
        sha256 = "39598cf5fad76f55466b5d4493466d69ddb5ac2c795a69a2fba99b665ab60c1f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/opencv/opencv-cpp/4.6.0-5/opencv-cpp-4.6.0-5-windowsarm64staticdebug.zip",
        sha256 = "56c393f95f05297d16114331dfe3a3332d75442fe3f26de6f5e0a87b1766324e",
        build_file_content = cc_library_static,
    )

def setup_legacy_bzlmodrio_opencv_cpp_dependencies():
    __setup_bzlmodrio_opencv_cpp_dependencies(None)

setup_bzlmodrio_opencv_cpp_dependencies = module_extension(
    __setup_bzlmodrio_opencv_cpp_dependencies,
)
