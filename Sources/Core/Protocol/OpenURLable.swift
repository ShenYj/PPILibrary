//
//  OpenURLable.swift
//
//
//  Created by ShenYj on 2021/03/31.
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
import Foundation
import SafariServices

public protocol OpenURLable { }


public extension OpenURLable {

    
    /// 打开`URL` 传入字符串类型, 若转换`URL`失败, 返回`false`
    ///
    /// - Note: `open(url: <#T##URL#>)`
    ///
    @discardableResult
    func open(url: String,
              options: [UIApplication.OpenExternalURLOptionsKey: Any] = [UIApplication.OpenExternalURLOptionsKey.universalLinksOnly: false],
              completionHandler: ((Bool) -> Void)? = nil) -> Bool {
        guard let url = URL(string: url) else { return false }
        return open(url: url, options: options, completionHandler: completionHandler)
    }
    
    /// 打开`URL`
    ///
    /// - Note: `UIApplication.shared.open(<#T##url: URL##URL#>, options: <#T##[UIApplication.OpenExternalURLOptionsKey : Any]#>, completionHandler: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)`
    ///
    @discardableResult
    func open(url: URL,
              options: [UIApplication.OpenExternalURLOptionsKey: Any] = [UIApplication.OpenExternalURLOptionsKey.universalLinksOnly: false],
              completionHandler: ((Bool) -> Void)? = nil) -> Bool {
        
        guard UIApplication.shared.canOpenURL(url) else { return false }
        UIApplication.shared.open(url, options: options, completionHandler: completionHandler)
        return true
    }
}

/// 在应用内调起`Safari`展示网页内容
///
/// - Note: 应用内展示`Safari`控制器
///
//public protocol OpenSafariInAppable { }
//public extension OpenSafariInAppable {
//    /// App内打开一个链接
//    ///
//    /// - Note: `App`内打开`SFSafariViewController`展示链接
//    ///
//    @discardableResult
//    func openOneLink(WithSafariInApp linkPath: String, rootVC: Bool = true) -> Bool {
//        guard let url = URL(string: linkPath) else { return false }
//        let safariVC = SFSafariViewController(url: url)
//        guard rootVC else {
//            guard let visibleController = UIApplication.visibleViewController() else { return false }
//            visibleController.present(safariVC, animated: true, completion: nil)
//            return true
//        }
//        guard let currentVC = UIApplication.shared.appKeyWindow?.rootViewController else { return false }
//        currentVC.present(safariVC, animated: true, completion: nil)
//        return true
//    }
//}
