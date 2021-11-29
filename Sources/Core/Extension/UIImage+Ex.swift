//
//  UIImage+Ex.swift
//
//
//  Created by ShenYj on 2021/03/25.
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

public extension UIImage {
    
    private struct AssociatedURLLinkKey {
        static var link: String = "AssociatedURLLinkKey"
    }
    
    var urlLink: String? {
        get { return objc_getAssociatedObject(self, &AssociatedURLLinkKey.link) as? String }
        set { objc_setAssociatedObject(self, &AssociatedURLLinkKey.link, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC) }
    }
}

public extension UIImage {
    
    // 二分压缩法
    func compressImageMid(maxLength: Int) -> Data? {
        
        var compression: CGFloat = 1
        guard var data = self.jpegData(compressionQuality: 1) else { return nil }
        #if DEBUG
        print("压缩前kb: \( Double((data.count)/1024))")
        #endif
        if data.count < maxLength {
            return data
        }
        #if DEBUG
        print("压缩前kb", data.count / 1024, "KB")
        #endif
        var max: CGFloat = 1
        var min: CGFloat = 0
        for _ in 0..<6 {
            compression = (max + min) / 2
            data = self.jpegData(compressionQuality: compression)!
            if CGFloat(data.count) < CGFloat(maxLength) * 0.9 {
                min = compression
            } else if data.count > maxLength {
                max = compression
            } else {
                break
            }
        }
        //var resultImage: UIImage = UIImage(data: data)!
        if data.count < maxLength { return data }
        return nil
    }
    
    /// 图片尺寸缩放
    ///
    /// - Note: `dlib`不支持过高分辨率 按照iPhone默认的图片分辨率转成bitmap *4字节 容量将超G
    ///
    func reSize(renderScale: CGFloat) -> UIImage {
        let targetW = self.size.width * renderScale
        let targetH = self.size.height * renderScale
        UIGraphicsBeginImageContextWithOptions(CGSize(width: targetW, height: targetH), false, 0.0)
        let bounds = CGRect(x: 0, y: 0, width: targetW, height: targetH)
        self.draw(in: bounds)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image ?? self
    }
    
    /// 将已有图片重新绘制颜色
    ///
    /// - Note: `iOS 13`直接使用新`API`完成, 低于`13.0`下重新绘制失败返回原图
    ///
    func render(WithColor renderColor: UIColor?) -> UIImage {
        guard let newColor = renderColor else {
            return self
        }
        if #available(iOS 13.0, *) {
            //return self.withTintColor(newColor)
            return self.withTintColor(newColor, renderingMode: .alwaysOriginal)
        } else {
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            newColor.setFill()
            let bounds = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            UIRectFill(bounds)
            draw(in: bounds, blendMode: .overlay, alpha: 1.0)
            draw(in: bounds, blendMode: .destinationIn, alpha: 1.0)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return image ?? self
        }
    }
}
