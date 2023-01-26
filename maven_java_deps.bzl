load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_opencv_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "edu_wpi_first_thirdparty_frc2022_opencv_opencv_java",
        artifact = "edu.wpi.first.thirdparty.frc2022.opencv:opencv-java:4.5.2-1",
        artifact_sha256 = "13e26524b06fe68c62d3ed285718014bb8c90b94b27223e037f252bd65b6121a",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )

def setup_legacy_bzlmodrio_opencv_java_dependencies():
    __setup_bzlmodrio_opencv_java_dependencies(None)

setup_bzlmodrio_opencv_java_dependencies = module_extension(
    __setup_bzlmodrio_opencv_java_dependencies,
)
