// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "libjxl",
    platforms: [
        .macOS(.v10_11), .iOS(.v9), .tvOS(.v9), .watchOS(.v2)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "libjxl",
            targets: ["libjxl"]),
        .library(
            name: "brotli",
            targets: ["brotli"]),
        .library(
            name: "hwy",
            targets: ["hwy"]),
        .library(
            name: "lcms",
            targets: ["lcms"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "libjxl",
            dependencies: ["brotli", "hwy", "lcms"],
            path: ".",
            exclude: ["libjxl/third_party",
                      // gtest
                      "libjxl/lib/jxl/opsin_image_test.cc",
                      "libjxl/lib/jxl/bits_test.cc",
                      "libjxl/lib/jxl/padded_bytes_test.cc",
                      "libjxl/lib/jxl/encode_test.cc",
                      "libjxl/lib/jxl/fast_dct_test.cc",
                      "libjxl/lib/jxl/render_pipeline/render_pipeline_test.cc",
                      "libjxl/lib/jxl/coeff_order_test.cc",
                      "libjxl/lib/jxl/rational_polynomial_test.cc",
                      "libjxl/lib/jxl/iaca_test.cc",
                      "libjxl/lib/jxl/passes_test.cc",
                      "libjxl/lib/jxl/blending_test.cc",
                      "libjxl/lib/jxl/image_ops_test.cc",
                      "libjxl/lib/jxl/butteraugli/butteraugli_test.cc",
                      "libjxl/lib/jxl/preview_test.cc",
                      "libjxl/lib/jxl/ac_strategy_test.cc",
                      "libjxl/lib/jxl/data_parallel_test.cc",
                      "libjxl/lib/jxl/fields_test.cc",
                      "libjxl/lib/jxl/gamma_correct_test.cc",
                      "libjxl/lib/jxl/jxl_test.cc",
                      "libjxl/lib/jxl/speed_tier_test.cc",
                      "libjxl/lib/jxl/simd_util_test.cc",
                      "libjxl/lib/jxl/lehmer_code_test.cc",
                      "libjxl/lib/jxl/quantizer_test.cc",
                      "libjxl/lib/jxl/toc_test.cc",
                      "libjxl/lib/jxl/icc_codec_test.cc",
                      "libjxl/lib/jxl/enc_photon_noise_test.cc",
                      "libjxl/lib/jxl/convolve_test.cc",
                      "libjxl/lib/jxl/dct_test.cc",
                      "libjxl/lib/jxl/patch_dictionary_test.cc",
                      "libjxl/lib/jxl/splines_test.cc",
                      "libjxl/lib/jxl/ans_common_test.cc",
                      "libjxl/lib/jxl/quant_weights_test.cc",
                      "libjxl/lib/jxl/opsin_inverse_test.cc",
                      "libjxl/lib/jxl/ans_test.cc",
                      "libjxl/lib/jxl/gradient_test.cc",
                      "libjxl/lib/jxl/modular_test.cc",
                      "libjxl/lib/jxl/byte_order_test.cc",
                      "libjxl/lib/jxl/cms/transfer_functions_test.cc",
                      "libjxl/lib/jxl/cms/tone_mapping_test.cc",
                      "libjxl/lib/jxl/roundtrip_test.cc",
                      "libjxl/lib/jxl/xorshift128plus_test.cc",
                      "libjxl/lib/jxl/color_encoding_internal_test.cc",
                      "libjxl/lib/jxl/bit_reader_test.cc",
                      "libjxl/lib/jxl/enc_external_image_test.cc",
                      "libjxl/lib/jxl/enc_optimize_test.cc",
                      "libjxl/lib/jxl/enc_linalg_test.cc",
                      "libjxl/lib/jxl/color_management_test.cc",
                      "libjxl/lib/jxl/alpha_test.cc",
                      "libjxl/lib/jxl/decode_test.cc",
                      "libjxl/lib/jxl/image_bundle_test.cc",
                      "libjxl/lib/jxl/fast_math_test.cc",
                      "libjxl/lib/jxl/enc_gaborish_test.cc",
                      "libjxl/lib/jxl/entropy_coder_test.cc",
                      // test
                      "libjxl/lib/jxl/dec_transforms_testonly.h",
                      "libjxl/lib/jxl/dec_transforms_testonly.cc",
                      "libjxl/lib/jxl/test_image.h",
                      "libjxl/lib/jxl/test_image.cc",
                      "libjxl/lib/jxl/test_utils.h",
                      "libjxl/lib/jxl/test_utils.cc",
                      // gbench
                      "libjxl/lib/jxl/enc_external_image_gbench.cc",
                      "libjxl/lib/jxl/splines_gbench.cc",
                      "libjxl/lib/jxl/dec_external_image_gbench.cc",
                      "libjxl/lib/jxl/tf_gbench.cc",
                      // threads test
                      "libjxl/lib/threads/thread_parallel_runner_test.cc"
                     ],
            sources: ["libjxl/lib/jxl", "libjxl/lib/threads"],
            publicHeadersPath: "include",
            cSettings: [.headerSearchPath("libjxl"),
                        .define("CMS_NO_REGISTER_KEYWORD")]
        ),
        .target(
            name: "brotli",
            path: "libjxl/third_party/brotli/c",
            exclude: ["fuzz", "tools"],
            publicHeadersPath: "include"
            ),
        .target(
            name: "hwy",
            path: "libjxl/third_party/highway",
            exclude: ["hwy/tests", "hwy/examples", "hwy/contrib",
                     "hwy/aligned_allocator_test.cc",
                     "hwy/highway_test.cc",
                     "hwy/nanobenchmark_test.cc",
                     "hwy/targets_test.cc",
                     "hwy/base_test.cc"],
            publicHeadersPath: "."
            ),
        .target(
            name: "lcms",
            path: "libjxl/third_party/lcms",
            exclude: [],
            sources: ["src"],
            publicHeadersPath: "include"
            )
    ],
    cLanguageStandard: .gnu11,
    cxxLanguageStandard: .gnucxx14
)
