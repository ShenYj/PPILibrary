#
#  Be sure to run `pod spec lint PPILibrary.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name               = "PPILibrary"
  spec.version            = "0.0.3"
  spec.homepage           = "https://github.com/ShenYj/PPILibrary"
  spec.license            = { :type => "MIT", :file => "License" }
  spec.authors            = { "ShenYj" => "shenyanjie123@foxmail.com" }
  spec.social_media_url   = "https://github.com/ShenYj/ShenYj.github.io/wiki"
  spec.requires_arc       = true
  spec.swift_versions     = ['5.0', '5.1', '5.2', '5.3', '5.4', '5.5']
  spec.cocoapods_version  = '>= 1.10.0'
  spec.source             = { :git => "https://github.com/ShenYj/PPILibrary.git", :tag => "#{spec.version}" }
  spec.summary            = "基础工具扩展库."
  spec.description        = <<-DESC
  个人开发的基础工具扩展库, 通过subspec增加了一些依赖库的扩展支持
  DESC

  spec.default_subspecs = "Core"
  spec.ios.deployment_target = "12.0"
  
  # Core 基础扩展
  spec.subspec "Core" do |core|
    core.source_files = "Sources/Core/", "Sources/Core/Protocol/", "Sources/Core/Extension/"
    core.frameworks = "Foundation", "UIKit"
  end
  
  # RxSwift 扩展
  spec.subspec "Rx" do |rx|
    rx.source_files = "Sources/Rx/", "Sources/Rx/RxErrorTracker/", "Sources/Rx/RxActivityIndicator/"
    rx.dependency "PPILibrary/Core"
    
    rx.dependency "RxSwift", "~> 6.0"
    rx.dependency "RxCocoa", "~> 6.0"
    rx.dependency "RxSwiftExt", "~> 6.0"
    rx.dependency "RxOptional", "~> 5.0"
    rx.dependency "NSObject+Rx", "~> 5.0"
    rx.dependency "RxGesture", "~> 4.0"
    rx.dependency "RxDataSources", "~> 5.0"

  end
  
end
