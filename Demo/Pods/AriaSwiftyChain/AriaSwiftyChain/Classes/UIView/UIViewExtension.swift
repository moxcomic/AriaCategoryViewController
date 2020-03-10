//
//  UIViewExtension.swift
//  AriaSwiftyChain
//
//  Created by 神崎H亚里亚 on 2019/11/27.
//  Copyright © 2019 moxcomic. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxDataSources

public extension UIView {
    @discardableResult
    func addToSuperview(_ superview: UIView) -> UIView {
        superview.addSubview(self)
        return self
    }
    
    @discardableResult
    @objc
    func addToSuperview() -> (UIView) -> UIView {
        return { (superview) in
            superview.addSubview(self)
            return self
        }
    }
    
    @discardableResult
    func makeConstraints(_ closure: (_ make: ConstraintMaker) -> ()) -> UIView {
        self.snp.makeConstraints { (make) in
            closure(make)
        }
        return self
    }
    
    @discardableResult
    func backgroundColor(_ backgroundColor: UIColor) -> UIView {
        self.backgroundColor = backgroundColor
        return self
    }
    
    @discardableResult
    @objc
    func setBackgroundColor() -> (UIColor) -> UIView {
        return { (backgroundColor) in
            self.backgroundColor = backgroundColor
            return self
        }
    }
    
    @discardableResult
    func borderWidth(_ borderWidth: CGFloat) -> UIView {
        self.layer.borderWidth = borderWidth
        return self
    }
    
    @discardableResult
    func borderColor(_ borderColor: UIColor?) -> UIView {
        self.layer.borderColor = borderColor?.cgColor
        return self
    }
    
    @discardableResult
    func cornerRadius(_ cornerRadius: CGFloat) -> UIView {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        return self
    }
}
