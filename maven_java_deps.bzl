load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_opencv_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "edu_wpi_first_thirdparty_frc2024_opencv_opencv_java",
        artifact = "edu.wpi.first.thirdparty.frc2024.opencv:opencv-java:4.8.0-1",
        artifact_sha256 = "79d6a1cd4c6e98c3a2be76e85fda775bcee504e5207b8a91cd08a219b896baf9",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )

def setup_legacy_bzlmodrio_opencv_java_dependencies():
    __setup_bzlmodrio_opencv_java_dependencies(None)

setup_bzlmodrio_opencv_java_dependencies = module_extension(
    __setup_bzlmodrio_opencv_java_dependencies,
)
