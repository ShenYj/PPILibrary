//
//  ShowMessageable.swift
//  
//
//  Created by ShenYj on 2021/03/24.
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

import SwiftMessages

public protocol ShowMessageable { }

extension ShowMessageable {
    
    /// 展示`message`
    func show(style: DialogType = .success, title: String? = nil, message: String? = nil, hideTitle: Bool? = true) {
        switch style {
        case .success:          show(success: title, body: message, hideTitle: hideTitle)
        case .error:            show(error: title, body: message, hideTitle: hideTitle)
        case .warning:          show(warning: title, body: message, hideTitle: hideTitle)
        case .transitionFaild:  show(transitionFaild: title, body: message, hideTitle: hideTitle)
        }
    }
    
    // TransitionFaild
    fileprivate func show(transitionFaild title: String? = "TransitionFaild", body: String?, hideTitle: Bool? = true) {
        
        let _title = title ?? "TransitionFaild"
        let _message = body ?? "Error during sequence conversion!"
        let error = MessageView.viewFromNib(layout: .cardView)
        
        error.titleLabel?.isHidden = hideTitle ?? true
        error.configureTheme(.error)
        error.configureContent(title: _title, body: _message)
        error.button?.isHidden = true
        
        var errorConfig = SwiftMessages.defaultConfig
        errorConfig.presentationStyle = .top
        errorConfig.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        
        SwiftMessages.show(config: errorConfig, view: error)
    }
    /// Error
    fileprivate func show(error title: String? = "Error", body: String?, hideTitle: Bool? = true) {
        
        let _title = title ?? "Error"
        let _message = body ?? "Something is horribly wrong!"
        let error = MessageView.viewFromNib(layout: .cardView)
        
        error.titleLabel?.isHidden = hideTitle ?? true
        error.configureTheme(.error)
        error.configureContent(title: _title, body: _message)
        error.button?.isHidden = true
        
        var errorConfig = SwiftMessages.defaultConfig
        errorConfig.presentationStyle = .top
        errorConfig.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        
        SwiftMessages.show(config: errorConfig, view: error)
    }
    /// Success
    fileprivate func show(success title: String? = "Success", body: String?, hideTitle: Bool? = true) {
        let _title = title ?? "Success"
        let _message = body ?? "Something good happened!"
        let success = MessageView.viewFromNib(layout: .cardView)
        
        success.titleLabel?.isHidden = hideTitle ?? true
        success.configureTheme(.success)
        success.configureDropShadow()
        success.configureContent(title: _title, body: _message)
        success.button?.isHidden = true
        
        var successConfig = SwiftMessages.defaultConfig
        successConfig.presentationStyle = .top
        successConfig.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        
        SwiftMessages.show(config: successConfig, view: success)
    }
    /// Warning
    fileprivate func show(warning title: String? = "Warning", body: String?, hideTitle: Bool? = true) {
        let _title = title ?? "Warning"
        let _message = body ?? "Consider yourself warned."
        let warning = MessageView.viewFromNib(layout: .cardView)
        
        warning.titleLabel?.isHidden = hideTitle ?? true
        warning.configureTheme(.warning)
        warning.configureDropShadow()
        warning.button?.isHidden = true
        
        //let iconText = ["🤔", "😳", "🙄", "😶"].randomElement()!
        //warning.configureContent(title: _title, body: _message, iconText: iconText)
        warning.configureContent(title: _title, body: _message)
        warning.button?.isHidden = true
        var warningConfig = SwiftMessages.defaultConfig
        warningConfig.presentationContext = .window(windowLevel: UIWindow.Level.normal)

        SwiftMessages.show(config: warningConfig, view: warning)
    }
}
