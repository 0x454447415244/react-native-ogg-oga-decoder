require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))
folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1 -Wno-comma -Wno-shorten-64-to-32'

Pod::Spec.new do |s|
  s.name         = "react-native-ogg-oga-decoder"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platforms    = { :ios => "10.0" }
  s.source       = { :git => "https://github.com/0x454447415244/react-native-ogg-oga-decoder.git", :tag => "#{s.version}" }

  s.source_files = "ios/**/*.{h,m,mm,c,cpp}", "ios/OggDecoder/*/*.{h,m,c,cpp}", 
  s.public_header_files = "ios/OggDecoder/include/*.h", "ios/ogg.xcframework/ios-arm64/ogg.xcframework/Headers/*.h", "ios/vorbis.xcframework/ios-arm64/vorbis.xcframework/Headers/*.h"
  s.vendored_frameworks = 'ios/vorbis.xcframework', 'ios/ogg.xcframework'

  s.dependency "React-Core"

  # Don't install the dependencies when we run `pod install` in the old architecture.
  if ENV['RCT_NEW_ARCH_ENABLED'] == '1' then
    s.compiler_flags = folly_compiler_flags + " -DRCT_NEW_ARCH_ENABLED=1"
    s.pod_target_xcconfig    = {
        "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/boost\"",
        #"CLANG_CXX_LANGUAGE_STANDARD" => "c++17"
        'CLANG_CXX_LANGUAGE_STANDARD' => 'c++11',
        'CLANG_CXX_LIBRARY' => 'libc++'
    }
    s.library = 'c++'

    s.dependency "React-Codegen"
    s.dependency "RCT-Folly"
    s.dependency "RCTRequired"
    s.dependency "RCTTypeSafety"
    s.dependency "ReactCommon/turbomodule/core"
  end
end
