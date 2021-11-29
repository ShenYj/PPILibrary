//
//  SandboxReadable.swift
//  
//
//  Created by ShenYj on 2021/02/10.
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

import Foundation

/// 关于`iOS File System`: "https://developer.apple.com/library/archive/documentation/FileManagement/Conceptual/FileSystemProgrammingGuide/FileSystemOverview/FileSystemOverview.html#//apple_ref/doc/uid/TP40010672-CH2-SW2"
///
/// - Note: 通过该协议使任意实例对象可以快速获得 `iOS` 系统常用沙盒路径
///
/// ```
/// .
/// ├── Documents
/// ├── Library
/// |     ├── Caches
/// │     └─- Preferences
/// └─- tmp
/// ```
///
public protocol SandboxReadable { }

public extension SandboxReadable {
    
    /// .documentDirectory
    ///
    /// - Note: `NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first`
    ///
    var documentDirectory: String? { NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first }
    
    /// .libraryDirectory
    ///
    /// - Note: `NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first`
    ///
    var libraryDirectory: String? { NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first }
    
    /// .preferencesDirectory
    ///
    /// - Note: `NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first?.appending("/Preferences")`
    ///
    var libraryPreferencesDirectory: String? { NSSearchPathForDirectoriesInDomains(.preferencePanesDirectory, .userDomainMask, true).first }
    
    /// .cachesDirectory
    ///
    /// - Note: `NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first`
    ///
    var libraryCachesDirectory: String? { NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first?.appending("/Preferences") }
    
    /// .temporayDirectory
    ///
    /// - Note: `NSTemporaryDirectory()`
    ///
    var tmpDirectory: String? { NSTemporaryDirectory() }
}

