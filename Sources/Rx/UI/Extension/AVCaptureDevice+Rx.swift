//
//  AVCaptureDevice+Rx.swift
//  
//
//  Created by ShenYj on 2021/04/28.
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


import RxSwift
import RxSwiftExt
import AVFoundation

public extension Reactive where Base == AVCaptureDevice {
    
    public var torchMode: Observable<AVCaptureDevice.TorchMode> {
        return base.rx
            .observe(AVCaptureDevice.TorchMode.self, "torchMode")
            .map{ $0 ?? .off }
    }
    
    public var flashlightOn: Binder<Bool> {
        return Binder(base) { tm, isOn in
            
            if isOn {
                guard tm.torchMode != AVCaptureDevice.TorchMode.on else { return }
                try? tm.lockForConfiguration()
                tm.torchMode = AVCaptureDevice.TorchMode.on
            }
            else {
                guard tm.torchMode != AVCaptureDevice.TorchMode.off else { return }
                tm.torchMode = AVCaptureDevice.TorchMode.off
                
            }
        }
    }
}

public extension AVCaptureDevice {
    
    /// `申请权限`
    public static func requestAccess(for mediaType: AVMediaType) -> Observable<Bool> {
        Observable<Bool>.fromAsync(AVCaptureDevice.requestAccess)(mediaType)
    }
    
    /// `判断是否具有权限`
    public static func authorizationStatus(for mediaType: AVMediaType) -> Observable<AVAuthorizationStatus> {
        Observable<AVAuthorizationStatus>.just(AVCaptureDevice.authorizationStatus(for: .video))
    }
}
