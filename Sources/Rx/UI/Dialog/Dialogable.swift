//
//  Dialogable.swift
//  
//
//  Created by ShenYj on 2021/09/05.
//
//  Copyright (c) 2021 ShenYj <shenyanjie123@foxmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import UIKit
import RxSwift

public typealias Dialog = (DialogType, Lib)
public let onErrorJustReturn = Dialog(.error, .banner(title: "操作失败", message: "onErrorJustReturn"))

/**
 + 文字类展示样式
 
 error               错误
 warning          警告
 success          成功
 transitionFaild 序列转换时失败
 */
public enum DialogType {
    case error
    case success
    case warning
    case transitionFaild
}


/// 使用的类库
public enum Lib {
    /// 黑色背景的`Toast`, 只有一句文字展示
    case toast(message: String)
    /// 基于`SwiftMessage`定义的消息提醒 (支持样式定义, 顶部展示)
    case message(title: String?, message: String)
    /// 基于`NotificationBannerSwift`定义的消息提醒(支持样式定义, 底部展示+支持最多3条同时堆叠展示)
    case banner(title: String?, message: String)
}


public extension Dialogable {
    
    /// 通用方法, 基于`UIViewController`提供
    ///
    /// - Parameter dialog: 封装的`Dialog`对象, 该方法会直接根据传参进行`lib`和`style`的展示
    /// - Parameter target: 如果需要指定则传入遵循`Dialogable`的载体, 否则使用`window`
    ///
    func show(universalDialog dialog: Dialog, on target: Dialogable? = nil) {
        
        let onTarget: UIView
        switch target {
        case let target as UIWindow:                onTarget = target
        case let target as UIView:                  onTarget = target
        case let target as UINavigationController:  onTarget = target.view
        case let target as UIViewController:        onTarget = target.view
        //case .none:                                 onTarget = AppDelegate.default!.appDependency.window
        default:                                    onTarget = appKeyWindow!
        }
        switch dialog.1 {
        case let .toast(message):
            onTarget.toast(on: onTarget, message: message)
        case let .message(title, message):
            onTarget.show(style: dialog.0, title: title, message: message)
        case let .banner(title, message):
            let banner = onTarget.bottomBanner(title: title, subTitle: message, bannerStyle: dialog.0, duration: 3)
            onTarget.showBanners([banner])
        }
    }
}


public protocol Dialogable: GetKeyWindowable, ShowMessageable, ShowToastable, ShowNotifyable { }

extension UIView: Dialogable { }
extension UIViewController: Dialogable { }
