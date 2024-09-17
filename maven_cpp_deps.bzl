load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

cc_library_headers = """cc_library(
    name = "headers",
    hdrs = glob(["**"]),
    includes = ["."],
    visibility = ["//visibility:public"],
)

filegroup(
    name = "header_files",
    srcs = glob(["**"]),
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-headers.zip",
        sha256 = "beb9a650f09094103e097571270cd2c5128941d6a6762f265390143e9ecd0916",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-sources.zip",
        sha256 = "573b2145e251a520918499c0ed2ad7752360188613fc392419a2315bcc57655b",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-linuxathena.zip",
        sha256 = "5c7d862c389bee565a21efef5579272afd9200cde5c2f9ff7e203916c90c5a41",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-linuxathenastatic.zip",
        sha256 = "697041a974a1e52889da520c4a3f12ca47ee900ff334744e5e57f669a0a417c9",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-linuxathenadebug.zip",
        sha256 = "9e704e6b0e97f7d522674e179dc6e4465e5b90e1a877bdd8e80be4aca04bb5c4",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-linuxathenastaticdebug.zip",
        sha256 = "8dc18af4d0970d3beb7f2236486120734936e6bd2b8652dfbea832b560680daf",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-linuxarm32.zip",
        sha256 = "9257a17c13de00239f45bfc26f8cd9b2c275a09ac8e62646728c52efbe14f105",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-linuxarm64.zip",
        sha256 = "a33fea33003f18fa6796c7d6f60487f9bad763cce983f1011998f3bb32a02bba",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-linuxx86-64.zip",
        sha256 = "8bdd16771be1218095c174c2a8fde789b77fbd9675212c4d5c2000f46b794aa1",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-osxarm64.zip",
        sha256 = "086701e5d94463ff173dfb972c9f1122aa8cc4102f644ad7385c7f96bfe93494",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-osxuniversal.zip",
        sha256 = "7d4f3b395170c78c3586a538aad2562f4191e657a57b0843faae93eb1590f8ae",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-windowsx86-64.zip",
        sha256 = "350d4a38951eecbe5bdacf87aa613b6a2a614df1790f3baa76b0f1af667763f9",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-windowsx86.zip",
        sha256 = "71d61b8a56f8bda55527e7f94050b75b09ef4d00d78c362a6f6c1288cdc116ff",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-windowsarm64.zip",
        sha256 = "3e999f0bccd93098d386f438c541770dccb03269640d63b46814db921208ecd9",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-linuxarm32static.zip",
        sha256 = "d0adeacadc4dac495967a8d20af5843d6540ad9171a3eea163e67bfba376cded",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-linuxarm64static.zip",
        sha256 = "bdd10f41325a54e94433a6ec673f3014d6692640b5ce9c3909fee5618d7bdab0",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-linuxx86-64static.zip",
        sha256 = "dc0be2fdb259ebc1ee4aa86f729ae78b9d524f3a703ecaf08035af1ffe2deb1c",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-osxarm64static.zip",
        sha256 = "9b034a92ee05d0980c39ea0770a14b01bc3ee9f15788f468e384b43a7d00c913",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-osxuniversalstatic.zip",
        sha256 = "b9f607687569215a87a58e53b349d3c7930f23ea1c951af88a49dc5f25a19cf2",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-windowsx86-64static.zip",
        sha256 = "d9d514fa28ed617b519e56ffa8d3acd72a320a4edd27dd7efa5299c6ae674e96",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-windowsx86static.zip",
        sha256 = "10a2911f5732a877a96a48dee1aa470f1ba48540383b88f23ebd81fe00f1e635",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-windowsarm64static.zip",
        sha256 = "499f8b8f699fb0f5e1837db5e34f9a6f2ad690e78775eaa4ca156e203b4a40b7",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-linuxarm32debug.zip",
        sha256 = "5a48cf06570e5e581f5e30f2ee61b49f8bc5c7c263d4a40b2a192e056deb3c64",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-linuxarm64debug.zip",
        sha256 = "20c0cb9a66b7c8f92a4cc486b3ff1e2056050c25e953720114c9d2c8826bd39b",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-linuxx86-64debug.zip",
        sha256 = "4b571ac88cb153b0820a193e58cbd9414aa74ace0fea0fc06815f6e837b65665",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-osxarm64debug.zip",
        sha256 = "e9232d75183484d57e4f0402baaaacff10807ed52e5f5635918fc5bb07c95e10",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-osxuniversaldebug.zip",
        sha256 = "cc40d725b1009d223e0dd5310970b4520178d52a2ef1a51b0dad0c5a109f9f13",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-windowsx86-64debug.zip",
        sha256 = "06646ead25cda99b12866809ced8429fad39affa8bc71df1d9d532a4f3e6e614",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-windowsx86debug.zip",
        sha256 = "5158d19abbab6340ccf7f1a4f6fef590472d63d77e388730ce0793cb78a578d3",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-windowsarm64debug.zip",
        sha256 = "22d068523e7aa72e94685e037d17aabd5555febe8e7c83bd17f3af0faabb70c8",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-linuxarm32staticdebug.zip",
        sha256 = "987c087e664e4d082387d8ac854f94796692d47b660785ffb1f1f541c6719494",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-linuxarm64staticdebug.zip",
        sha256 = "3501ad132d0331518b5651619fe913c9b24e1e3ccfa19addaaea5715ed93e5c3",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-linuxx86-64staticdebug.zip",
        sha256 = "e6322ec5762c674a6cce824999fd0690b5e8ac21483e741fe8290a68737c1864",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-osxarm64staticdebug.zip",
        sha256 = "2ec6ecdb896546a3199d6840a431432dfe1cf5ca798450ba3ce4915cd21bfdf5",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-osxuniversalstaticdebug.zip",
        sha256 = "7a33b97e7ea4ca3feed9d7c327e387508a9b9d177e2c15f922b265daec780f58",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-windowsx86-64staticdebug.zip",
        sha256 = "51436122d06a0699d7fd24f8f384a8056a5957fc5f20c2937e84efbd884f4a83",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-windowsx86staticdebug.zip",
        sha256 = "15fda9ecf5c0fe842c22217ba260766db1024a32219073d3412183ba1eabfa87",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_opencv_opencv-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/opencv/opencv-cpp/4.8.0-4/opencv-cpp-4.8.0-4-windowsarm64staticdebug.zip",
        sha256 = "5820be96eb01d3c0fe9684d2cbff11ba65646f7884fa6cf469a2093b4ee1013c",
        build_file = "@bzlmodrio-opencv//private/cpp/opencv:static.BUILD.bazel",
    )

def setup_legacy_bzlmodrio_opencv_cpp_dependencies():
    __setup_bzlmodrio_opencv_cpp_dependencies(None)

setup_bzlmodrio_opencv_cpp_dependencies = module_extension(
    __setup_bzlmodrio_opencv_cpp_dependencies,
)
