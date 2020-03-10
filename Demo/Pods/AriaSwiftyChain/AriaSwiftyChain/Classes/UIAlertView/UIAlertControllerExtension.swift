//
//  UIAlertControllerExtension.swift
//  AriaSwiftyChain
//
//  Created by 神崎H亚里亚 on 2019/11/27.
//  Copyright © 2019 moxcomic. All rights reserved.
//

import UIKit

public extension UIAlertController {
    @objc
    static func show(withTitle title: String? = nil, message: String? = nil, style: Style = .alert, confirmText: String = "OK", handlerBlock: ((UIAlertAction) -> ())? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        let confirmAction = UIAlertAction(title: confirmText, style: .default, handler: handlerBlock)
        alert.addAction(confirmAction)
        UIViewController.topViewController()?.present(alert, animated: true)
    }
    
    @objc
    static func show(withTitle title: String? = nil, message: String? = nil, style: Style = .alert, cancelText: String = "取消", actions: [String], cancelBlock: ((UIAlertAction) -> ())? = nil, completionBlock: ((Int) -> ())? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        for i in 0..<actions.count {
            let action = UIAlertAction(title: actions[i], style: .default) { (action) in completionBlock?(i) }
            alert.addAction(action)
        }
        let cancel = UIAlertAction(title: cancelText, style: .cancel, handler: cancelBlock)
        alert.addAction(cancel)
        UIViewController.topViewController()?.present(alert, animated: true)
    }
}
