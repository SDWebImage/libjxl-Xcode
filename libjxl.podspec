#
# Be sure to run `pod lib lint TestLibrary.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'libjxl'
  s.version          = '0.10.0'
  s.summary          = 'JPEG XL image format reference implementation'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
JPEG XL image format reference implementation
                       DESC

  s.homepage         = 'https://jpeg.org/jpegxl/'
  s.license          = { :type => 'BSD 3-Clause' }
  s.author           = 'Google Inc.', 'Cloudinary Ltd.'
  s.source           = { :git => 'https://github.com/SDWebImage/libjxl-Xcode.git', :tag => s.version.to_s, :submodules => true }

  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.11'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'
  s.visionos.deployment_target = '1.0'

  s.subspec 'brotli' do |ss|
    ss.source_files = 'libjxl/third_party/brotli/c/**/*.{c,cc}'
    ss.exclude_files = 'libjxl/third_party/brotli/c/fuzz', 'libjxl/third_party/brotli/c/tools'
    ss.pod_target_xcconfig = {
      'HEADER_SEARCH_PATHS' => '${PODS_ROOT}/libjxl/libjxl/third_party/brotli/c/include ${PODS_ROOT}/libjxl/libjxl/third_party/brotli/c'
    }
  end

  s.subspec 'lcms' do |ss|
    ss.source_files = 'libjxl/third_party/lcms/src/**/*.{c,cc}'
    ss.pod_target_xcconfig = {
      'HEADER_SEARCH_PATHS' => '${PODS_ROOT}/libjxl/libjxl/third_party/lcms/include ${PODS_ROOT}/libjxl/libjxl/third_party/lcms/src'
    }
  end

  s.subspec 'hwy' do |ss|
    ss.source_files = 'libjxl/third_party/highway/hwy/**/*.{c,cc}'
    ss.exclude_files = 'libjxl/third_party/highway/hwy/tests', 'libjxl/third_party/highway/hwy/examples', 'libjxl/third_party/highway/hwy/contrib', 'libjxl/third_party/highway/hwy/*_test.{c,cc}'
    ss.pod_target_xcconfig = {
      'HEADER_SEARCH_PATHS' => '${PODS_ROOT}/libjxl/libjxl/third_party/highway'
    }
  end

  s.subspec 'jxl' do |ss|
    ss.dependency 'libjxl/brotli'
    ss.dependency 'libjxl/lcms'
    ss.dependency 'libjxl/hwy'
    ss.source_files = 'libjxl/lib/jxl/**/*.{c,cc}', 'generate/**/*.{c,cc}', 'libjxl/lib/include/**/*.h'
    ss.exclude_files = [
    'libjxl/lib/jxl/**/*_test.{c,cc}', # gtest
    'libjxl/lib/jxl/dec_transforms_testonly.{c,cc}', # test
    'libjxl/lib/jxl/test_image.{c,cc}', # test
    'libjxl/lib/jxl/test_utils.{c,cc}', # test
    'libjxl/lib/jxl/**/*_gbench.{c,cc}' # gbench
    ]
    ss.header_mappings_dir = 'libjxl/lib/include'
    ss.public_header_files = 'libjxl/lib/include/**/*.h'
    ss.compiler_flags = '-DCMS_NO_REGISTER_KEYWORD', '-fnew-alignment=8', '-fno-cxx-exceptions', '-fno-slp-vectorize', '-fno-vectorize'
    ss.pod_target_xcconfig = {
      'HEADER_SEARCH_PATHS' => '${PODS_ROOT}/libjxl/libjxl/lib/include ${PODS_ROOT}/libjxl/generate ${PODS_ROOT}/libjxl/libjxl'
    }
  end

  # Copy generate headers into include folder
  s.prepare_command = <<-CMD
  cp -R './generate/jxl' './libjxl/lib/include/'
                      CMD

  s.default_subspecs = 'jxl'
  s.libraries = 'c++'
  s.preserve_paths = 'libjxl', 'generate'
end
