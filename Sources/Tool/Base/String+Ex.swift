//
//  String+Ex.swift
//  
//
//  Created by ShenYj on 2021/03/22.
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

extension String: StringConvertible { }

extension String {
    /**
     *  MARK: - String转换为NSString
     *
     *  - Returns:
     *      - 返回NSString对象
     */
    public var toNSString: NSString {
        get {
            return (self as NSString)
        }
    }
    
    /**
     *  MARK: - 获取字符串的长度
     *
     *  - Returns:
     *      - 返回字符串的长度
     */
    public var length: Int {
        get {
            return self.toNSString.length
        }
    }
    
    /**
     *  MARK: - 计算文本的宽高
     *
     *  - Parameters:
     *      - size: 预设大小
     *      - attributes: 富文本属性设置
     *  - Returns:
     *      - size: 文本的大小
     */
    public func size(_ size: CGSize = CGSize(width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT)), attributes: [NSAttributedString.Key: Any]?) -> CGSize {
        return self.boundingRect(with: size, options: [.truncatesLastVisibleLine, .usesFontLeading, .usesLineFragmentOrigin], attributes: attributes, context: nil).size
    }
    
    /**
     *  MARK: - 计算字符串的行数
     *
     *  - Parameters:
     *      - fixedWidth: 固定宽度
     *      - font: 字体字号
     *      - lineSpacing: 行间距
     *  - Returns:
     *      - 返回字符串的行数
     **/
    public func rowsNumber(by fixedWidth: CGFloat, font: UIFont, lineSpacing: CGFloat?) -> Int {
        let text = self
        let drawingRect = CGRect(x: 0, y: 0, width: fixedWidth, height: CGFloat(MAXFLOAT))
        
        /// 创建富文本
        let attributedString = NSMutableAttributedString(string: text)
        let myFont = CTFontCreateWithName(font.fontName as CFString, font.pointSize, nil)
        attributedString.addAttribute(kCTFontAttributeName as NSAttributedString.Key, value: myFont, range: NSMakeRange(0, text.count))
        
        if let tempLineSpacing = lineSpacing {
            var spacing = tempLineSpacing
            let paragraphStyle = CTParagraphStyleSetting(spec: CTParagraphStyleSpecifier.lineSpacingAdjustment, valueSize: Int(spacing), value: &spacing)
            attributedString.addAttribute(kCTParagraphStyleAttributeName as NSAttributedString.Key, value: paragraphStyle, range: NSMakeRange(0, text.length))
        }
        
        /// 创建对象字符串、路径
        let framesetter = CTFramesetterCreateWithAttributedString(attributedString as CFAttributedString)
        let path = CGMutablePath()
        path.addRect(drawingRect)
        let textFrame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, nil)
        
        /// 计算的结果
        let lines = CTFrameGetLines(textFrame) as Array
        return lines.count
    }
    
    /**
     *  MARK: - 检查字符串，并返回结果
     *
     *  - Parameters:
     *      - defaultValue: 空默认值
     *  - Returns:
     *      - 新结果
     */
    func checkEmptyValue(defaultValue: String = "/") -> String {
        return self.isEmpty ? defaultValue : self
    }
}
