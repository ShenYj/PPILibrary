# PPILibrary

Personal plug-in library

## 功能介绍

- [x] `Core` 核心基础扩展， 不依赖于任何三方库

## 使用

- 默认， 不包含 RxSwift 及任何衍生库

    ```ruby
    pod 'PPILibrary'
    ```

- 根据 `subspec` 指定

    ```ruby
    pod 'PPILibrary', :subspecs => ['Core'], :git => 'https://github.com/ShenYj/PPILibrary.git'
    ```

    需要衍生库时，可通过 `subspec` 指定

    ```ruby
    pod 'PPILibrary', :subspecs => ['Core', 'Rx/UI/Animate'], :git => 'https://github.com/ShenYj/PPILibrary.git'
    ```

- 指定版本

    ```ruby
    pod 'PPILibrary', :git => 'https://github.com/ShenYj/PPILibrary.git', :tag => '0.0.2'
    ```

- 根据 `subspec` 和版本来指定

    ```ruby
    pod 'PPILibrary', :subspecs => ['Core', 'Rx/UI/Animate'], :git => 'https://github.com/ShenYj/PPILibrary.git', :tag => '0.0.4'
    ```

- 指定某一次提交记录

    ```ruby
    def libs_forme
    pod 'PPILibrary',
        :subspecs => [
            'Core',
            'Tool/Base',
            'Tool/Log',
            'Tool/Cache',
            'Tool/Security',
            'Tool/Deserialize/ObjectMapper',
            'UI/Colour',
            'Rx/Net/Moya',
            'Rx/UI/Dialog',
            'Rx/UI/MVVM',
            'Rx/UI/Extension',
            'Rx/UI/Animate'
        ],
        :git => 'https://github.com/ShenYj/PPILibrary.git',
        :commit => '9aaab0d'
    end
    ```

- 调试

    ```ruby
    post_install do |installer|
    installer.pods_project.targets.each do |target|
        if ( target.name == 'PPILibrary' )
        target.build_configurations.each do |config|
            if config.name == 'Debug'
            # 为 Swift 添加预编译宏
            config.build_settings['OTHER_SWIFT_FLAGS'] ||= ['-D', 'DEBUG_FILE_LOG']
            # 为 Swift 添加预编译宏 （Xcode 8 以后推荐的方式）
            config.build_settings['SWIFT_ACTIVE_COMPILATION_CONDITIONS'] = "$(inherited) DEBUG_FILE_LOG"
            end
          end
        end
      end
    end
    ```

