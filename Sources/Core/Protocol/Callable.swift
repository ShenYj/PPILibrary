//
//  Callable.swift
//  
//
//  Created by ShenYj on 2021/05/12.
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

public protocol Callable { }

public extension Callable {
    
    /// 拨打电话
    ///
    /// - Note: 只负责唤起拨号服务， 不作任何业务检查
    ///
    @discardableResult
    func callTo(Phone number: String) -> Bool {
        guard let finalUrl = URL(string: "\(tel_scheme)\(number)") else { return false }
        guard UIApplication.shared.canOpenURL(finalUrl) else { return false }
        UIApplication.shared.open(finalUrl,
                                  options: [UIApplication.OpenExternalURLOptionsKey.universalLinksOnly: false],
                                  completionHandler: nil)
        return true
    }
}
