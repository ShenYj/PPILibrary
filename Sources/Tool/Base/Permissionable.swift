//
//  Permissionable.swift
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


import UIKit
import AVFoundation
import LocalAuthentication

public protocol Permissionable { }

/**
 
 + 摄像头和闪光灯相关状态
 
    是否可用
    授权状态
 
 */

public extension Permissionable {
    
    /// 摄像头是否授权
    ///
    /// - Note: 摄像头是否授权
    ///
    var isCameraAuthority: Bool { AVCaptureDevice.authorizationStatus(for: .video) == .authorized }
    
    /// 摄像头授权状态
    ///
    /// - Note: 当前前置摄像头授权状态
    ///
    var cameraAuthorizationStatus: AVAuthorizationStatus { AVCaptureDevice.authorizationStatus(for: .video) }
    
    /// 前置摄像头是否可用
    ///
    /// - Note: 前置摄像头
    ///
    var isFrontCameraAvailable: Bool { UIImagePickerController.isCameraDeviceAvailable(.front) }
    
    /// 后置摄像头是否可用
    ///
    /// - Note: 后置摄像头
    ///
    var isRearCameraAvailable: Bool { UIImagePickerController.isCameraDeviceAvailable(.rear) }
    
    /// 是否有摄像头
    ///
    /// - Note: 是否有摄像头
    ///
    var hasCamera: Bool { UIImagePickerController.isSourceTypeAvailable(.camera) }
    
    /// 检查后(置摄像头或前置摄像头)是否可用
    ///
    /// - Note: 只要有一个可用返回`true`
    ///
    var isCameraAvailable: Bool { isFrontCameraAvailable || isRearCameraAvailable }
    
    //var isAlbumAvailable: Bool { GYDeviceInfo.isPhotoAlbumAvailable() }
}

public extension Permissionable {

    /// 检查手电筒是否存在
    ///
    /// - Note: `可用` or `故障或者不存在`
    ///
    var hasTorch: Bool {
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else { return false }
        return device.hasTorch
    }
    static var hasTorch: Bool {
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else { return false }
        return device.hasTorch
    }
    
    /// 检查手电筒是否可用
    ///
    /// - Note: 例如设备过热, 需要降温。此属性键值可观测
    ///
    var isTorchAvailable: Bool {
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else { return false }
        return device.isTorchAvailable
    }
    static var isTorchAvailable: Bool {
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else { return false }
        return device.isTorchAvailable
    }
    
    /// 检查手电筒是否处于开启状态
    ///
    /// - Note: 检查手电筒是否处于开启状态
    ///
    var isFlashlightOn: Bool {
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else { return false }
        if device.torchMode == AVCaptureDevice.TorchMode.on { return true }
        return false
    }
    static var isFlashlightOn: Bool {
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else { return false }
        if device.torchMode == AVCaptureDevice.TorchMode.on { return true }
        return false
    }
}
