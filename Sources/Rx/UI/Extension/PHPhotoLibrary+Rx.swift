//
//  PHPhotoLibrary+Rx.swift
//  
//
//  Created by EZen on 2021/9/7.
//

import Photos
import RxSwift

public extension PHPhotoLibrary {
    
    public static func requestAuthorization() -> Observable<PHAuthorizationStatus> {
        Observable<PHAuthorizationStatus>.fromAsync(PHPhotoLibrary.requestAuthorization)
    }
    
    public static func requestAuthorization() -> Observable<Bool> {
        requestAuthorization().map{ $0 == .authorized }
    }
}
