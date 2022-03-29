//
//  ATTracking+Rx.swift
//  
//
//  Created by ShenYj on 2021/07/14.
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
import RxRelay
import RxCocoa
import RxSwiftExt
import AppTrackingTransparency

public struct IDFA {
    
    static func finished() -> Signal<Bool> {
        if #available(iOS 14, *) {
            return ATTrackingManager.authForTrackingADF()
        } else {
            return Signal.just(true).startWith(false)
        }
    }
}

@available(iOS 14, *)
public extension ATTrackingManager {
    
    static func requestTrackingAuthorization() -> Observable<ATTrackingManager.AuthorizationStatus> {
        Observable<ATTrackingManager.AuthorizationStatus>
            .fromAsync(ATTrackingManager.requestTrackingAuthorization(completionHandler:))
            .asObservable()
            .do(onNext: { status in
                switch status {
                case .notDetermined:    log.debug("未选择")
                case .authorized:       log.debug("已授权")
                case .denied:           log.debug("明确拒绝")
                case .restricted:       log.debug("未授权, 受限")
                @unknown default:       log.debug("未知")
                }
            })
            .startWith(.notDetermined)
            .distinctUntilChanged()
    }
    
    static func authForTrackingADF() -> Signal<Bool> {
        requestTrackingAuthorization()
            .map{ $0 != .notDetermined }
            .distinctUntilChanged()
            .asSignal(onErrorJustReturn: true)
    }
}


@available(iOS 15, *)
public extension ATTrackingManager {
    @available(iOS 15, *)
    static func idfa_iOS_15_Complete() async -> Bool {
        let status = await ATTrackingManager.requestTrackingAuthorization()
        switch status {
        case .notDetermined:    return false
        default:                return true
        }
    }
}
