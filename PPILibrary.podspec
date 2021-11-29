#
#  Be sure to run `pod spec lint PPILibrary.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name               = "PPILibrary"
  spec.version            = "0.0.1"
  spec.homepage           = "https://github.com/ShenYj/PPILibrary"
  spec.license            = { :type => "MIT", :file => "License" }
  spec.authors            = { "ShenYj" => "shenyanjie123@foxmail.com" }
  spec.social_media_url   = "https://github.com/ShenYj/ShenYj.github.io/wiki"
  spec.requires_arc       = true
  spec.swift_versions     = ['5.2', '5.4', '5.5']
  spec.source             = { :git => "https://github.com/ShenYj/PPILibrary.git", :tag => "#{spec.version}" }
  spec.summary            = "基础工具扩展库."
  spec.description        = <<-DESC
  个人开发的基础工具扩展库, 通过subspec增加了一些依赖库的扩展支持
  DESC

  spec.default_subspec = ['Core']
  
  spec.ios.deployment_target = "12.0"
  # spec.osx.deployment_target = "10.7"
  # spec.watchos.deployment_target = "2.0"
  # spec.tvos.deployment_target = "9.0"
  
  # Core 基础扩展, 不依赖任何三方库
  spec.subspec "Core" do |core|
    core.source_files = ['Sources/Core/*.swift', 'Sources/Core/*.h']
    core.frameworks = "Foundation", "UIKit"
  end
  
  #spec.source_files  = "Classes", "Classes/**/*.{h,m}"
  #spec.exclude_files = "Classes/Exclude"
  # spec.public_header_files = "Classes/**/*.h"
  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"
  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"
  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"
  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"

end
