load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

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

def __setup_bzlmodrio_opencv_cpp_dependencies(mctx):
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-headers.zip",
        sha256 = "55c78d5cd6253656936310f417e12fb5f540f2864692cef9501bee73a9bf2e8e",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-sources.zip",
        sha256 = "e8203be9fe553ce2cb80d286423e43fbb84891ac36de38a3dc71f0d302cca968",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-linuxathena.zip",
        sha256 = "abe69f6cac06637e1b4fcd46ea9f08f09e43cdf36b37e531440677c69dfa7973",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-linuxathenastatic.zip",
        sha256 = "e79f2f54a8aec9d33f350d85f1af6fe47e54291d1a2682a31e183f3797858d3c",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-linuxathenadebug.zip",
        sha256 = "598b2e5057833250a0b90f8153156d6f319833fd01669bd5014ef34f454548af",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-linuxathenastaticdebug.zip",
        sha256 = "3d2e75dcaf5497ffd17f57b2a37b63b0e43f10cc5001a96b87cccd97b5667882",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-linuxarm32.zip",
        sha256 = "d1f5289db0791a91d8eab7d073387775c99b886f6aa6139924059879c6bd7e32",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-linuxarm64.zip",
        sha256 = "560e890ef4d9b8bf43549263548cb3ed20d1f438e64bed20527cd0f5e9ecddb4",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-linuxx86-64.zip",
        sha256 = "1a0a046ec0f022334562d5cd0c4fbfd1613a1d2e430fa2a58cda7347bb1491cf",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-osxarm64.zip",
        sha256 = "414c82269d608ab46e0c72aefd6bed5216596e75d16cd0dc2cfc508a15527c13",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-osxuniversal.zip",
        sha256 = "2a600d9b96ef31c605f929bab15643861e443a034ffdd869f5de9f8206a93f02",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-windowsx86-64.zip",
        sha256 = "f62223e5490b60d0d2d181dcb7bc32cbf060082afbf548ee65a2ea9779dcce9d",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-windowsx86.zip",
        sha256 = "ced00457d857648d949b4906af203af3199ba85725b32bbbdf357a0e8a3200a2",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-windowsarm64.zip",
        sha256 = "ee612ae00850c0a5f0a2dce65978a496c27af6d6802bc4607b8089974ca2a9b6",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-linuxarm32static.zip",
        sha256 = "4157692e6c812f50f266c524b1aa07fd318464f7e82756a5ebbcf6dcacc34ad3",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-linuxarm64static.zip",
        sha256 = "77a75d1dfbbe6d543e031519b90fac6e61858129d6dd1f498b08b4723166a87d",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-linuxx86-64static.zip",
        sha256 = "e1e9b2173e423a9e651d4740c29d8b9a2a2ab4d68526bbaccaad5949fa664a0d",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-osxarm64static.zip",
        sha256 = "80d9a71b7cbcfa2edb0a21a7a7004d108bb66b2b57d9d4161650ced3460af657",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-osxuniversalstatic.zip",
        sha256 = "88815a7d3e852dcd5124c0c7905c2c01fdb86cef89e1d741b09361ef6f6974ff",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-windowsx86-64static.zip",
        sha256 = "0592f3d25b8273bcd72110d32bdadacbcd227e0f494eff6814ddff6d5a0a6638",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-windowsx86static.zip",
        sha256 = "86c78121562cc1ad0c090ff94f7621863857992a5589ef5d6aba852a6463014b",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-windowsarm64static.zip",
        sha256 = "9a248b758ec5532fb6860c1ba8e968b92a9c7e8de10aaecaad4dfd9bb51567df",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-linuxarm32debug.zip",
        sha256 = "efe862204bee3afe5b2e00cb8018b3df7549b3693d4cc93137e1000cc1465210",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-linuxarm64debug.zip",
        sha256 = "3535fccb1c2371c0b5f3ffb174bd642314335b1a9689fcb4ee00e08c92a8cee2",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-linuxx86-64debug.zip",
        sha256 = "964e492419ef40516625a35ffa4bade77861a16018bff4f511641e17c44823fa",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-osxarm64debug.zip",
        sha256 = "fa55dbe2cfb832752ed87ce31d351c4266b2d8d942c85c5019e0f5d79bfea468",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-osxuniversaldebug.zip",
        sha256 = "2b32c016424481cdcca43d230457361638ea947e44050f38458a4a2b798409db",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-windowsx86-64debug.zip",
        sha256 = "8ba494f824a0c9bf5609679333e524c9dddd5e40ba1f5be91029782a7abd0a79",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-windowsx86debug.zip",
        sha256 = "2fcc58c9a82da9c5c69e16e0dd05767c4d5c6f0f5d05f24e7375c68234d9e663",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-windowsarm64debug.zip",
        sha256 = "9fd1b7d4164dc7e33f1d8e5582b802330f84bf656a387286ac12e09777c1994a",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-linuxarm32staticdebug.zip",
        sha256 = "f7b6d779e86f6457482467ef87313ade4582665f15cfa44d5294c4b29a12d6a8",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-linuxarm64staticdebug.zip",
        sha256 = "5b161a35a92647f3bb598c190058f46f4f3e2ac5055d37260387ac501245f9c4",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-linuxx86-64staticdebug.zip",
        sha256 = "1b8e25a36fb3e0ef0eaae0dc12a6d5169f024f02e76f104c70f620a12ac62f1e",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-osxarm64staticdebug.zip",
        sha256 = "fd34cddb9413d8e47c0c0293e285bbba53ad142d8357822827a8dc730c9f2f5e",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-osxuniversalstaticdebug.zip",
        sha256 = "469e04a496c047935a33af827da25248d039d8c35e8acfb00484f6fb22392203",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-windowsx86-64staticdebug.zip",
        sha256 = "7276013b1eddbd3b1e32f2329a6aa582543cd6bbb353dad98abf0416ee4fbc61",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-windowsx86staticdebug.zip",
        sha256 = "4e3a22465b547f59feca9cb9cbe823885454f67e769213542841f53b90d7bbc9",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-2/opencv-cpp-4.8.0-2-windowsarm64staticdebug.zip",
        sha256 = "4cccf7d59b74742b3fb186d98932029137a42c5ad12c8113837b4c7e7d19f0a6",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:static.BUILD.bazel",
    )

def setup_legacy_bzlmodrio_opencv_cpp_dependencies():
    __setup_bzlmodrio_opencv_cpp_dependencies(None)

setup_bzlmodrio_opencv_cpp_dependencies = module_extension(
    __setup_bzlmodrio_opencv_cpp_dependencies,
)
