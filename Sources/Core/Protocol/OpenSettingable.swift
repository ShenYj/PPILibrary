//
//  OpenSettingable.swift
//
//
//  Created by ShenYj on 2021/02/26.
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

public protocol OpenSettingable { }

public extension OpenSettingable {
    
    /// 打开系统设置页
    ///
    /// - Note: 不处理回调
    ///
    /// - Returns: `URL(string: UIApplication.openSettingsURLString)`转`URL`失败时返回`false`
    ///
    @discardableResult
    func openSystemSettingPage(options: [UIApplication.OpenExternalURLOptionsKey: Any] = [UIApplication.OpenExternalURLOptionsKey.universalLinksOnly: false],
                               completionHandler: ((Bool) -> Void)? = nil)
    -> Bool {
        guard let systemURL = URL(string: UIApplication.openSettingsURLString) else { return false }
        UIApplication.shared.open(systemURL, options: options, completionHandler: completionHandler)
        return true
    }
    
}

