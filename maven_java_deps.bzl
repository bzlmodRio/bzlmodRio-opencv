load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_opencv_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "edu_wpi_first_thirdparty_frc2024_opencv_opencv_java",
        artifact = "edu.wpi.first.thirdparty.frc2024.opencv:opencv-java:4.8.0-2",
        artifact_sha256 = "5410a9ecc510d7b88acf52e5998136a7b0c6318b4bcdcbf80102d9446a43763a",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )

def setup_legacy_bzlmodrio_opencv_java_dependencies():
    __setup_bzlmodrio_opencv_java_dependencies(None)

setup_bzlmodrio_opencv_java_dependencies = module_extension(
    __setup_bzlmodrio_opencv_java_dependencies,
)
