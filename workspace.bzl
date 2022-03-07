load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository", "new_git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def clean_dep(dep):
    return str(Label(dep))

def _test_archive_impl(repository_ctx):
  repository_ctx.extract(repository_ctx.attr.src)
  repository_ctx.file("BUILD.bazel", repository_ctx.read(repository_ctx.attr.build_file))

test_archive = repository_rule(
    attrs = {
        "src": attr.label(mandatory = True, allow_single_file = True),
        "build_file": attr.label(mandatory = True, allow_single_file = True),
    },
    implementation = _test_archive_impl,
)

def atom_db_workspace():

    new_git_repository(
        name = "rocksdb",
        remote = "git@github.com:facebook/rocksdb.git",
        tag = "v6.28.2",
        build_file = clean_dep("//dep/rocksdb:rocksdb.BUILD"),
    )
     
    git_repository(
        name = "protobuf",
        remote = "git@github.com:protocolbuffers/protobuf.git",
        tag = "v3.19.4",
    )
    
    git_repository(
        name = "gtest",
        remote = "git@github.com:google/googletest",
        branch = "v1.10.x",
    )
    # git_repository(
    #     name = "com_github_grpc_grpc",
    #     #remote = "https://gitee.com/anynone/grpc-grpc.git",
    #     remote = "git@github.com:grpc/grpc.git",
    #     # remote = "https://github.com/grpc/grpc.git",
    #     #remote = "https://hub.fastgit.org/grpc/grplsc.git",
    #     #tag = "v1.39.0",
    #     branch = "master",
    # )
    # http_archive(
    #     name="grpc",
    #     remote = "https://gitee.com/anynone/grpc-grpc.git",
    #     tag = "v1.39.0",
    # )


    # https://github.com/grpc/grpc.git
    native.local_repository(
        name = "com_github_grpc_grpc",
        path = "/data1/wuyongyu/tmp/grpc-master",
    )

    # https://github.com/protocolbuffers/upb.git
    native.local_repository(
        name = "upb",
        path = "/data1/wuyongyu/tmp/upb",
    )

    # https://github.com/bazelbuild/rules_swift.git
    native.local_repository(
        name = "build_bazel_rules_swift",
        path = "/data1/wuyongyu/tmp/rules_swift-master",
    )

    # https://github.com/bazelbuild/rules_apple.git
    native.local_repository(
        name = "build_bazel_rules_apple",
        path = "/data1/wuyongyu/tmp/rules_apple-master",
    )

    # https://github.com/bazelbuild/apple_support.git
    native.local_repository(
        name = "build_bazel_apple_support",
        path = "/data1/wuyongyu/tmp/apple_support-master",
    )

    # https://github.com/abseil/abseil-cpp.git
    native.local_repository(
        name = "com_google_absl",
        path = "/data1/wuyongyu/tmp/abseil-cpp-master",
    )

    # https://github.com/google/re2.git
    native.local_repository(
        name = "re2",
        path = "/data1/wuyongyu/tmp/re2-main",
    )

    # https://github.com/bazelbuild/rules_go.git
    native.local_repository(
        name = "io_bazel_rules_go",
        path = "/data1/wuyongyu/tmp/rules_go-master",
    )

    # https://github.com/bazelbuild/rules_python.git
    native.local_repository(
        name = "rules_python",
        path = "/data1/wuyongyu/tmp/rules_python-main",
    )

    # com_google_googleapis_imports
    # https://github.com/googleapis/googleapis.git
    native.local_repository(
        name = "com_google_googleapis",
        path = "/data1/wuyongyu/tmp/googleapis-master",
    )

    # https://github.com/googleapis/gapic-generator-csharp.git
    native.local_repository(
        name = "gapic_generator_csharp",
        path = "/data1/wuyongyu/tmp/gapic-generator-csharp-main",
    )

    # https://github.com/googleapis/gapic-generator-php
    native.local_repository(
        name = "gapic_generator_php",
        path = "/data1/wuyongyu/tmp/gapic-generator-php-main",
    )
    # https://github.com/googleapis/rules_gapic
    native.local_repository(
        name = "rules_gapic",
        path = "/data1/wuyongyu/tmp/rules_gapic-main",
    )

    # https://github.com/bazelbuild/rules_cc.git
    native.local_repository(
        name = "rules_cc",
        path = "/data1/wuyongyu/tmp/rules_cc-main",
    )

    # https://github.com/bazelbuild/rules_proto.git
    native.local_repository(
        name = "rules_proto",
        path = "/data1/wuyongyu/tmp/rules_proto-master",
    )
