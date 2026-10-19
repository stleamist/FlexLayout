
Pod::Spec.new do |spec|
  spec.name         = "FlexLayout"
  spec.version      = "2.2.3"
  spec.summary      = "FlexLayout"
  spec.homepage     = "https://github.com/lucdion/FlexLayout.git"
  spec.license      = "MIT license"
  spec.author       = { "Luc Dion" => "luc_dion@yahoo.com" }

  spec.platform     = :ios, "13.4"
  spec.source       = { :git => "https://github.com/lucdion/FlexLayout.git", :tag => "#{spec.version}", :submodules => true }
  spec.source_files = "Sources/**/*.{swift,h,m,mm,cpp,c}"
  spec.public_header_files = "Sources/YogaKit/include/YogaKit/*.h"
  spec.libraries    = 'c++'


  # Should match yoga_defs.bzl + BUCK configuration
  spec.compiler_flags = [
     '-fno-omit-frame-pointer',
     '-fexceptions',
     '-Wall',
     '-Werror',
     '-std=c++20',
     '-fPIC'
  ]

  # Prefer copied public headers so Clang does not load both source and framework copies.
  spec.pod_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => '"$(CONFIGURATION_BUILD_DIR)/$(PUBLIC_HEADERS_FOLDER_PATH)" "$(PODS_TARGET_SRCROOT)/ThirdParty/yoga"',
  }
  spec.preserve_paths = 'ThirdParty/yoga/LICENSE', 'ThirdParty/yoga/yoga/**/*.h'

  spec.subspec 'Yoga' do |yoga|
    yoga.source_files = 'ThirdParty/yoga/yoga/**/*.cpp', 'ThirdParty/yoga/yoga/*.h'
    yoga.public_header_files = 'ThirdParty/yoga/yoga/*.h'
    yoga.header_mappings_dir = 'ThirdParty/yoga'
    yoga.requires_arc = false
  end
end
