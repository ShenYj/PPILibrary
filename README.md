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
