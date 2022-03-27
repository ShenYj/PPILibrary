#
#  Be sure to run `pod spec lint PPILibrary.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name               = "PPILibrary"
  spec.version            = "0.0.7"
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

  spec.ios.deployment_target = "11.0"
  spec.default_subspecs      = "Core"
  
  
  # Core 基础扩展
  spec.subspec "Core" do |core|
    core.source_files = "Sources/Core/", "Sources/Core/Protocol/", "Sources/Core/Extension/"
    core.frameworks = "Foundation", "UIKit"
  end
    
  # 基础 工具类 开源库扩展
  spec.subspec "Tool" do |tool|
    tool.dependency "R.swift", "~> 6.0"
    tool.dependency "SwiftDate", "~> 6.0"
    tool.dependency "Dollar", "~> 9.0"
    tool.dependency "SwifterSwift/SwiftStdlib", "~> 5.0"
    tool.dependency "SwifterSwift/Foundation", "~> 5.0"
    tool.dependency "SwifterSwift/Dispatch", "~> 5.0"
    
    ## Log 工具
    tool.subspec "Log" do |log|
      log.source_files = "Sources/Tool/Log/"
      log.dependency "CocoaLumberjack/Swift", "~> 3.0"
    end
    
    ## 持久化
    tool.subspec "Cache" do |cache|
      cache.dependency "SwiftyUserDefaults", "~> 5.0"
    end
    
    ## 加密
    tool.subspec "Security" do |security|
      security.dependency "CryptoSwift", "~> 1.0"
    end
    
    ## 反序列化
    tool.subspec "Deserialize" do |deserialize|
      deserialize.dependency "SwiftyJSON", "~> 5.0"
      
      ### ObjectMapper
      deserialize.subspec "ObjectMapper" do |om|
        om.dependency "ObjectMapper", "~> 4.0"
      end
    end
  end
  
  # 基础 UI 开源库扩展
  spec.subspec "UI" do |ui|
    ui.dependency "SnapKit", "~> 5.0"
    ui.dependency "Then", "~> 2.0"
    ui.dependency "DeviceKit", "~> 4.0"
    ui.dependency "FCUUID", "~> 1.0"
    ui.dependency "MJRefresh", "~> 3.0"
    ui.dependency "IQKeyboardManagerSwift", "~> 6.0"
    ui.dependency "SwifterSwift/UIKit", "~> 5.0"
    ui.dependency "SwifterSwift/CoreGraphics", "~> 5.0"
    ui.dependency "SwifterSwift/CoreAnimation", "~> 5.0"
    
    ## 颜色
    ui.subspec "Colour" do |colour|
      colour.dependency "Hue", "~> 5.0"
    end

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

    ## RxSwift UI 扩展
    rx.subspec "UI" do |ui|
      ui.source_files = "Sources/Rx/UI/"
      ui.dependency "RxUIAlert", "~> 1.5"
      ui.dependency "RxAlertViewable", "~> 1.0"
      ui.dependency "RxKingfisher", "~> 2.0"
      ui.dependency "RxAppState", "~> 1.7"
      ui.dependency "RxViewController", "~> 2.0"
      
      ### MVVM
      ui.subspec "MVVM" do |mvvm|
        mvvm.source_files = "Sources/Rx/UI/MVVM/"
      end
      
      ### RxSwift 动画扩展
      ui.subspec "Animate" do |animate|
        animate.dependency "RxAnimated", "~> 0.9"
      end
    end
    
    ## RxSwift 网络 扩展
    rx.subspec "Net" do |net|
      net.dependency "RxAlamofire", "~> 6.0"
      
      ## RxSwift Moya
      net.subspec "Moya" do |moya|
        moya.dependency "Moya/RxSwift", "~> 15.0"
      end
      
    end
    
    ## RxSwift 定位扩展
    #rx.subspec "LBS" do |lbs|
      #lbs.dependency "RxCoreLocation", "~> 1.5"
    #end
    
  end

  
end
