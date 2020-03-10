//
//  UIImageVIewExtension.swift
//  AriaSwiftyChain
//
//  Created by 神崎H亚里亚 on 2019/12/10.
//  Copyright © 2019 moxcomic. All rights reserved.
//

import UIKit

public extension UIImageView {
    @discardableResult
    func contentMode(_ contentMode: ContentMode) -> UIImageView {
        self.contentMode = contentMode
        return self
    }
    
    @discardableResult
    @objc
    func setContentMode() -> (ContentMode) -> UIImageView {
        return { (contentMode) in
            self.contentMode = contentMode
            return self
        }
    }
    
    @discardableResult
    func clipsToBounds(_ clipsToBounds: Bool = true) -> UIImageView {
        self.clipsToBounds = clipsToBounds
        return self
    }
    
    @discardableResult
    @objc
    func setClipsToBounds() -> (Bool) -> UIImageView {
        return { (clipsToBounds) in
            self.clipsToBounds = clipsToBounds
            return self
        }
    }
    
    @discardableResult
    func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool = true) -> UIImageView {
        self.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    
    @discardableResult
    @objc
    func setIsUserInteractionEnabled() -> (Bool) -> UIImageView {
        return { (isUserInteractionEnabled) in
            self.isUserInteractionEnabled = isUserInteractionEnabled
            return self
        }
    }
    
    @discardableResult
    func image(_ image: UIImage) -> UIImageView {
        self.image = image
        return self
    }
    
    @discardableResult
    @objc
    func setImage() -> (UIImage) -> UIImageView {
        return { (image) in
            self.image = image
            return self
        }
    }
}
