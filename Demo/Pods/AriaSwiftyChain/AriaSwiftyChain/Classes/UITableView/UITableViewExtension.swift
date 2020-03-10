//
//  UITableViewExtension.swift
//  AriaSwiftyChain
//
//  Created by 神崎H亚里亚 on 2019/12/3.
//  Copyright © 2019 moxcomic. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxDataSources

public extension UITableView {
    @discardableResult
    func tableHeaderView(view: UIView) -> UITableView {
        self.tableHeaderView = view
        return self
    }
    
    @discardableResult
    @objc
    func setTableHeaderView() -> (UIView) -> UITableView {
        return { (view) in
            self.tableHeaderView = view
            return self
        }
    }
    
    @discardableResult
    func tableFooterView(view: UIView = UIView()) -> UITableView {
        self.tableFooterView = view
        return self
    }
    
    @discardableResult
    @objc
    func setTableFooterView() -> (UIView) -> UITableView {
        return { (view) in
            self.tableFooterView = view
            return self
        }
    }
    
    @discardableResult
    func scrollIndicatorInsets(_ scrollIndicatorInsets: UIEdgeInsets) -> UITableView {
        self.scrollIndicatorInsets = scrollIndicatorInsets
        return self
    }
    
    @discardableResult
    @objc
    func setScrollIndicatorInsets() -> (UIEdgeInsets) -> UITableView {
        return { (scrollIndicatorInsets) in
            self.scrollIndicatorInsets = scrollIndicatorInsets
            return self
        }
    }
    
    @discardableResult
    func scrollIndicatorInsets(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) -> UITableView {
        self.scrollIndicatorInsets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        return self
    }
    
    @discardableResult
    @objc
    func setScrollIndicatorInsetsWithTLBR() -> (CGFloat, CGFloat, CGFloat, CGFloat) -> UITableView {
        return { (top, left, bottom, right) in
            self.scrollIndicatorInsets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
            return self
        }
    }
    
    @discardableResult
    func contentInset(_ contentInset: UIEdgeInsets) -> UITableView {
        self.contentInset = contentInset
        return self
    }
    
    @discardableResult
    @objc
    func setContentInset() -> (UIEdgeInsets) -> UITableView {
        return { (contentInset) in
            self.contentInset = contentInset
            return self
        }
    }
    
    @discardableResult
    func contentInset(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) -> UITableView {
        self.contentInset = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        return self
    }
    
    @discardableResult
    @objc
    func setContentInsetWithTLBR() -> (CGFloat, CGFloat, CGFloat, CGFloat) -> UITableView {
        return { (top, left, bottom, right) in
            self.contentInset = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
            return self
        }
    }
    
    @discardableResult
    func estimatedRowHeight(_ estimatedRowHeight: CGFloat = 44) -> UITableView {
        self.estimatedRowHeight = estimatedRowHeight
        return self
    }
    
    @discardableResult
    @objc
    func setEstimatedRowHeight() -> (CGFloat) -> UITableView {
        return { (estimatedRowHeight) in
            self.estimatedRowHeight = estimatedRowHeight
            return self
        }
    }
    
    @discardableResult
    func showsScrollIndicator(_ showsScrollIndicator: Bool = false) -> UITableView {
        self.showsVerticalScrollIndicator = showsScrollIndicator
        self.showsHorizontalScrollIndicator = showsScrollIndicator
        return self
    }
    
    @discardableResult
    func setShowsScrollIndicator() -> (Bool) -> UITableView {
        return { (showsScrollIndicator) in
            self.showsVerticalScrollIndicator = showsScrollIndicator
            self.showsHorizontalScrollIndicator = showsScrollIndicator
            return self
        }
    }
    
    @discardableResult
    func rowHeight(_ rowHeight: CGFloat) -> UITableView {
        self.rowHeight = rowHeight
        return self
    }
    
    @discardableResult
    func setRowHeight() -> (CGFloat) -> UITableView {
        return { (rowHeight) in
            self.rowHeight = rowHeight
            return self
        }
    }
}
