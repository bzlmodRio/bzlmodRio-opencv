load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_opencv_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "edu_wpi_first_thirdparty_frc2023_opencv_opencv_java",
        artifact = "edu.wpi.first.thirdparty.frc2023.opencv:opencv-java:4.6.0-4",
        artifact_sha256 = "da6930eca2774ba731568245f0aeaf829f61292134f4d7a35d82a39903817402",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )

def setup_legacy_bzlmodrio_opencv_java_dependencies():
    __setup_bzlmodrio_opencv_java_dependencies(None)

setup_bzlmodrio_opencv_java_dependencies = module_extension(
    __setup_bzlmodrio_opencv_java_dependencies,
)
