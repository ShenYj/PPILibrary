//
//  ShowNotifyable.swift
//  
//
//  Created by ShenYj on 2021/09/03.
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


import NotificationBannerSwift

public protocol ShowNotifyable { }

public extension ShowNotifyable {
    
    /// 底部展示消息
    ///
    /// - Note: 最多同时展示三条消息
    ///
    func showBanners(_ banners: [FloatingNotificationBanner]) {
        
        let notificationBannerQueue = NotificationBannerQueue(maxBannersOnScreenSimultaneously: 3)
        banners.forEach { banner in
            banner.show(bannerPosition: BannerPosition.bottom,
                        queue: notificationBannerQueue,
                        cornerRadius: 8,
                        shadowColor: UIColor(red: 0.431, green: 0.459, blue: 0.494, alpha: 1),
                        shadowBlurRadius: 16,
                        shadowEdgeInsets: UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8))
        }
    }
}

public extension ShowNotifyable {
    
    /// 初始化`FloatingNotificationBanner`
    ///
    /// - Note: 最多同时展示三条消息
    ///
    func bottomBanner(title: String? = nil,
                      subTitle: String? = nil,
                      bannerStyle: DialogType? = .success,
                      duration: TimeInterval = ToastManager.shared.duration)
    -> FloatingNotificationBanner {
        
        let type: NotificationBannerSwift.BannerStyle
        switch bannerStyle {
        case .error:            type = .danger
        case .warning:          type = .warning
        case .success:          type = .success
        case .transitionFaild:  type = .danger
        case .none:             type = .success
        }
        
        return banner(title: title,
                      subTitle: subTitle,
                      bannerStyle: type,
                      duration: duration,
                      position: .bottom)
    }
}


public extension ShowNotifyable {
    
    /// 初始化`FloatingNotificationBanner`
    ///
    /// - Note: 最多同时展示三条消息
    ///
    fileprivate func banner(title: String? = nil,
                            subTitle: String? = nil,
                            bannerStyle: BannerStyle? =  .info,
                            duration: TimeInterval = ToastManager.shared.duration,
                            position: ToastPosition = ToastManager.shared.position)
    -> FloatingNotificationBanner {
        
        let banner = FloatingNotificationBanner(title: title,
                                                subtitle: subTitle,
                                                titleFont: nil,
                                                titleColor: nil,
                                                titleTextAlign: nil,
                                                subtitleFont: nil,
                                                subtitleColor: nil,
                                                subtitleTextAlign: nil,
                                                leftView: nil,
                                                rightView: nil,
                                                style: bannerStyle ?? .info,
                                                colors: nil,
                                                iconPosition: .top)
        
        return banner
    }
}



