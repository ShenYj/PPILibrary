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
  spec.social_media_url   = "https://github.com/ShenYj/ShenYj"
  spec.requires_arc       = true
  spec.swift_versions     = ['5.0', '5.6']
  spec.cocoapods_version  = '>= 1.10.0'
  spec.source             = { :git => "https://github.com/ShenYj/PPILibrary.git", :tag => "#{spec.version}" }
  spec.summary            = "基础工具扩展库."
  spec.description        = <<-DESC
                            个人开发的基础工具扩展库, 通过 subspec 增加了一些依赖库的扩展支持
                            
                            * Core: 基础扩展
                            * Rx: 包含 RxSwift、RxCocoa、RxSwiftExt、RxOptional、NSObject+Rx、RxGesture、RxDataSources
                            * UI: 包含 RxUIAlert、RxAlertViewable、RxKingfisher、RxAppState、RxViewController
                              * Animate: 包含 RxAnimated
                            * LBS: 包含 RxCoreLocation
                            DESC

  spec.ios.deployment_target = "12.0"
  spec.default_subspecs      = "Core"
  
  
  # Core 基础扩展
  spec.subspec "Core" do |core|
    core.source_files = "Sources/Core/", "Sources/Core/Protocol/", "Sources/Core/Extension/"
    core.frameworks = "Foundation", "UIKit"
  end
  
  # RxSwift 扩展
  spec.subspec "Rx" do |rx|
    rx.source_files = "Sources/Rx/*.swift", "Sources/Rx/RxErrorTracker/", "Sources/Rx/RxActivityIndicator/"
    rx.dependency "PPILibrary/Core"
    
    rx.dependency "RxSwift", "~> 6.0"
    rx.dependency "RxCocoa", "~> 6.0"
    rx.dependency "RxSwiftExt", "~> 6.0"
    rx.dependency "RxOptional", "~> 5.0"
    rx.dependency "NSObject+Rx", "~> 5.0"
    rx.dependency "RxGesture", "~> 4.0"
    rx.dependency "RxDataSources", "~> 5.0"

    rx.subspec "UI" do |ui|
      ui.source_files = "Sources/Rx/UI/"
      ui.dependency "RxUIAlert", "~> 1.5"
      ui.dependency "RxAlertViewable", "~> 1.0"
      ui.dependency "RxKingfisher", "~> 2.0"
      ui.dependency "RxAppState", "~> 1.7"
      #ui.dependency "RxViewController", "~> 2.0"
      
      ui.subspec "Animate" do |animate|
        animate.dependency "RxAnimated", "~> 0.9"
      end
    end

    #rx.subspec "LBS" do |lbs|
      #lbs.dependency "RxCoreLocation", "~> 1.0"
    #end
    
  end
  
end
