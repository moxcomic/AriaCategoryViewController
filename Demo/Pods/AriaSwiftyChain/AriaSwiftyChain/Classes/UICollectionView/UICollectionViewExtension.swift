//
//  UICollectionViewExtension.swift
//  AriaSwiftyChain
//
//  Created by 神崎H亚里亚 on 2019/12/3.
//  Copyright © 2019 moxcomic. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxDataSources

public extension UICollectionView {
    @discardableResult
    func showsScrollIndicator(_ showsScrollIndicator: Bool = false) -> UICollectionView {
        self.showsVerticalScrollIndicator = showsScrollIndicator
        self.showsHorizontalScrollIndicator = showsScrollIndicator
        return self
    }
    
    @discardableResult
    func setShowsScrollIndicator() -> (Bool) -> UICollectionView {
        return { (showsScrollIndicator) in
            self.showsVerticalScrollIndicator = showsScrollIndicator
            self.showsHorizontalScrollIndicator = showsScrollIndicator
            return self
        }
    }
}
