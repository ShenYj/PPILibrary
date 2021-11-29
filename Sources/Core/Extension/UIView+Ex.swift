//
//  UIView+Ex.swift
//
//
//  Created by ShenYj on 2021/09/08.
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
import CoreGraphics

public extension UIView {
    
    /// 气泡容器
    static func bubble(borderWidth: CGFloat = 1, borderColor: UIColor = .blue, fillColor: UIColor = .white.withAlphaComponent(0.2)) -> UIView {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.maskedCorners = .allCorner
        view.layer.borderWidth = borderWidth
        view.layer.borderColor = borderColor.cgColor
        view.backgroundColor = fillColor
        return view
    }
}

public extension UIView {
    
    /// `绘制虚线`
    ///
    /// - Note: fillColor 指定为蓝色
    ///
    func drawDashLine(_ lineView: UIView, strokeColor: UIColor, lineWidth: CGFloat = 1, lineLength: Int = 10, lineSpacing: Int = 5) {
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.bounds = lineView.bounds
        shapeLayer.anchorPoint = CGPoint(x: 0, y: 0)
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.strokeColor = strokeColor.cgColor
        
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        
        //每一段虚线长度 和 每两段虚线之间的间隔
        shapeLayer.lineDashPattern = [NSNumber(value: lineLength), NSNumber(value: lineSpacing)]
        
        let path = CGMutablePath()
        let x = lineView.layer.bounds.width - lineWidth
        path.move(to: CGPoint(x: x, y: 0))
        path.addLine(to: CGPoint(x: x, y: lineView.layer.bounds.height))
        shapeLayer.path = path
        
        lineView.layer.addSublayer(shapeLayer)
    }
    
    /// `边框虚线`
    func drawBorderDashLine(_ lineView: UIView, lineColor: UIColor, lineWidth: CGFloat = 1) {
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.fillColor = nil
        shapeLayer.path = UIBezierPath(rect: lineView.bounds).cgPath
        shapeLayer.frame = lineView.bounds
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineCap = .square
        shapeLayer.lineDashPattern = [4, 2]
        lineView.layer.addSublayer(shapeLayer)
    }
    
}
