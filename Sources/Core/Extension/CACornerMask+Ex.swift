//
//  CACornerMask+Ex.swift
//  
//
//  Created by ShenYj on 2021/05/21.
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

public extension CACornerMask {
    
    /// 左上、左下
    static var leftCorner: CACornerMask { [.layerMinXMinYCorner, .layerMinXMaxYCorner] }
    /// 右上、右下
    static var rightCorner: CACornerMask { [.layerMaxXMinYCorner, .layerMaxXMaxYCorner] }
    /// 上左、上右
    static var topCorner: CACornerMask { [.layerMinXMinYCorner, .layerMaxXMinYCorner] }
    /// 下左、下右
    static var bottomCorner: CACornerMask { [.layerMinXMaxYCorner, .layerMaxXMaxYCorner] }
    /// 上左、上右、下左、下右
    static var allCorner: CACornerMask { [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner] }
}

public extension UIView {
    
    /// 设置圆角
    ///
    /// - Note: 默认`radius`为`5`, 四个角
    ///
    func setCorner(radius: CGFloat = 5.0, maskedCorners: CACornerMask = .allCorner ) {
        layer.cornerRadius = radius
        layer.maskedCorners = maskedCorners
    }
}
