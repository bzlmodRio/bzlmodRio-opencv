load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_opencv_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "edu_wpi_first_thirdparty_frc2023_opencv_opencv_java",
        artifact = "edu.wpi.first.thirdparty.frc2023.opencv:opencv-java:4.6.0-5",
        artifact_sha256 = "dd74cfd431ef56eb873ce8f81966c4351cbf7f865b798077a2b060787ac697b6",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )

def setup_legacy_bzlmodrio_opencv_java_dependencies():
    __setup_bzlmodrio_opencv_java_dependencies(None)

setup_bzlmodrio_opencv_java_dependencies = module_extension(
    __setup_bzlmodrio_opencv_java_dependencies,
)
