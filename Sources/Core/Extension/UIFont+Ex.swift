//
//  UIFont+Ex.swift
//
//
//  Created by ShenYj on 2021/05/25.
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

public extension UIFont {
    
    // MARK: 默认字体
    static let SYS_F8  = UIFont.systemFont(ofSize: 8)
    static let SYS_F9  = UIFont.systemFont(ofSize: 9)
    static let SYS_F10 = UIFont.systemFont(ofSize: 10)
    static let SYS_F11 = UIFont.systemFont(ofSize: 11)
    static let SYS_F12 = UIFont.systemFont(ofSize: 12)
    static let SYS_F13 = UIFont.systemFont(ofSize: 13)
    static let SYS_F14 = UIFont.systemFont(ofSize: 14)
    static let SYS_F15 = UIFont.systemFont(ofSize: 15)
    static let SYS_F16 = UIFont.systemFont(ofSize: 16)
    static let SYS_F17 = UIFont.systemFont(ofSize: 17)
    static let SYS_F18 = UIFont.systemFont(ofSize: 18)
    static let SYS_F19 = UIFont.systemFont(ofSize: 19)
    static let SYS_F20 = UIFont.systemFont(ofSize: 20)
    static let SYS_F22 = UIFont.systemFont(ofSize: 22)
    static let SYS_F23 = UIFont.systemFont(ofSize: 23)
    static let SYS_F24 = UIFont.systemFont(ofSize: 24)
    static let SYS_F25 = UIFont.systemFont(ofSize: 25)
    static let SYS_F26 = UIFont.systemFont(ofSize: 26)
    static let SYS_F27 = UIFont.systemFont(ofSize: 27)
    static let SYS_F28 = UIFont.systemFont(ofSize: 28)
    static let SYS_F29 = UIFont.systemFont(ofSize: 29)
    static let SYS_F30 = UIFont.systemFont(ofSize: 30)
    
    // MARK: medium 字体
    static let SYS_MDEIUM_F08 = UIFont.systemFont(ofSize: 08, weight: .medium)
    static let SYS_MDEIUM_F09 = UIFont.systemFont(ofSize: 09, weight: .medium)
    static let SYS_MDEIUM_F10 = UIFont.systemFont(ofSize: 10, weight: .medium)
    static let SYS_MDEIUM_F11 = UIFont.systemFont(ofSize: 11, weight: .medium)
    static let SYS_MDEIUM_F12 = UIFont.systemFont(ofSize: 12, weight: .medium)
    static let SYS_MDEIUM_F13 = UIFont.systemFont(ofSize: 13, weight: .medium)
    static let SYS_MDEIUM_F14 = UIFont.systemFont(ofSize: 14, weight: .medium)
    static let SYS_MDEIUM_F15 = UIFont.systemFont(ofSize: 15, weight: .medium)
    static let SYS_MDEIUM_F16 = UIFont.systemFont(ofSize: 16, weight: .medium)
    static let SYS_MDEIUM_F17 = UIFont.systemFont(ofSize: 17, weight: .medium)
    static let SYS_MDEIUM_F18 = UIFont.systemFont(ofSize: 18, weight: .medium)
    static let SYS_MDEIUM_F19 = UIFont.systemFont(ofSize: 19, weight: .medium)
    static let SYS_MDEIUM_F20 = UIFont.systemFont(ofSize: 20, weight: .medium)
    static let SYS_MDEIUM_F21 = UIFont.systemFont(ofSize: 21, weight: .medium)
    static let SYS_MDEIUM_F22 = UIFont.systemFont(ofSize: 22, weight: .medium)
    static let SYS_MDEIUM_F23 = UIFont.systemFont(ofSize: 23, weight: .medium)
    static let SYS_MDEIUM_F24 = UIFont.systemFont(ofSize: 24, weight: .medium)
    static let SYS_MDEIUM_F25 = UIFont.systemFont(ofSize: 25, weight: .medium)
    static let SYS_MDEIUM_F26 = UIFont.systemFont(ofSize: 26, weight: .medium)
    static let SYS_MDEIUM_F27 = UIFont.systemFont(ofSize: 27, weight: .medium)
    static let SYS_MDEIUM_F28 = UIFont.systemFont(ofSize: 28, weight: .medium)
    static let SYS_MDEIUM_F29 = UIFont.systemFont(ofSize: 29, weight: .medium)
    static let SYS_MDEIUM_F30 = UIFont.systemFont(ofSize: 30, weight: .medium)
    static let SYS_MDEIUM_F31 = UIFont.systemFont(ofSize: 31, weight: .medium)
    static let SYS_MDEIUM_F32 = UIFont.systemFont(ofSize: 32, weight: .medium)
    
    // MARK: bold 字体
    static let SYS_BOLD_F10 = UIFont.systemFont(ofSize: 10, weight: .bold)
    static let SYS_BOLD_F11 = UIFont.systemFont(ofSize: 11, weight: .bold)
    static let SYS_BOLD_F12 = UIFont.systemFont(ofSize: 12, weight: .bold)
    static let SYS_BOLD_F13 = UIFont.systemFont(ofSize: 13, weight: .bold)
    static let SYS_BOLD_F14 = UIFont.systemFont(ofSize: 14, weight: .bold)
    static let SYS_BOLD_F15 = UIFont.systemFont(ofSize: 15, weight: .bold)
    static let SYS_BOLD_F16 = UIFont.systemFont(ofSize: 16, weight: .bold)
    static let SYS_BOLD_F17 = UIFont.systemFont(ofSize: 17, weight: .bold)
    static let SYS_BOLD_F18 = UIFont.systemFont(ofSize: 18, weight: .bold)
    static let SYS_BOLD_F19 = UIFont.systemFont(ofSize: 19, weight: .bold)
    static let SYS_BOLD_F20 = UIFont.systemFont(ofSize: 20, weight: .bold)
    static let SYS_BOLD_F21 = UIFont.systemFont(ofSize: 21, weight: .bold)
    static let SYS_BOLD_F22 = UIFont.systemFont(ofSize: 22, weight: .bold)
    static let SYS_BOLD_F23 = UIFont.systemFont(ofSize: 23, weight: .bold)
    static let SYS_BOLD_F24 = UIFont.systemFont(ofSize: 24, weight: .bold)
    static let SYS_BOLD_F25 = UIFont.systemFont(ofSize: 25, weight: .bold)
    static let SYS_BOLD_F26 = UIFont.systemFont(ofSize: 26, weight: .bold)
    static let SYS_BOLD_F27 = UIFont.systemFont(ofSize: 27, weight: .bold)
    static let SYS_BOLD_F28 = UIFont.systemFont(ofSize: 28, weight: .bold)
    static let SYS_BOLD_F29 = UIFont.systemFont(ofSize: 29, weight: .bold)
    static let SYS_BOLD_F30 = UIFont.systemFont(ofSize: 30, weight: .bold)
    static let SYS_BOLD_F31 = UIFont.systemFont(ofSize: 31, weight: .bold)
    static let SYS_BOLD_F32 = UIFont.systemFont(ofSize: 32, weight: .bold)
}
