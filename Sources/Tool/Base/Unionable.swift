//
//  Unionable.swift
//  
//
//  Created by ShenYj on 2021/02/25.
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

import Dollar

public protocol Unionable {

    // 数据合并
    ///
    /// - Note: 取交集, 用于网络请求回来后是拼接在前面, 还是追加在后面
    ///
    /// - Parameter originalData: 原始数据
    /// - Parameter targetData:   目标数据
    /// - Parameter flag:         是否追加
    ///
    func union<T: Hashable>(of originalData: [T], with targetData: [T]?, append flag: Bool) -> [T]
}

public extension Unionable {
    
    
    /// 数据合并
    ///
    /// - Note: 取交集, 用于网络请求回来后是拼接在前面, 还是追加在后面
    ///
    /// - Parameter originalData: 原始数据
    /// - Parameter targetData:   目标数据
    /// - Parameter flag:         是否追加
    ///
    func union<T: Hashable>(of originalData: [T], with targetData: [T]?, append flag: Bool) -> [T] {
        guard let newData = targetData else { return originalData }
        var final = originalData
        if flag {
            final = Dollar.union(originalData, newData)
        }
        else {
            final = Dollar.union(newData, originalData)
        }
        return final
    }
}
