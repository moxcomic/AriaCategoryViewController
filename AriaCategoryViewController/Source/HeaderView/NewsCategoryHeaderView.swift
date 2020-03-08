//
//  NewsCategoryHeaderView.swift
//  VideoMoments
//
//  Created by 神崎H亚里亚 on 2020/3/6.
//  Copyright © 2020 Future Studio. All rights reserved.
//

import UIKit
import Then

class NewsCategoryHeaderView: UICollectionReusableView {
    // MARK: - 控件
    fileprivate lazy var titleLabel = UILabel().then {
        $0.textColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).font(.boldSystemFont(ofSize: 20))
    }
    
    var model: String! {
        didSet {
            titleLabel.text(model)
        }
    }
    
    // MARK: - 系统方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NewsCategoryHeaderView {
    fileprivate func setupView() {
        titleLabel.addToSuperview(self).makeConstraints {
            $0.top.bottom.right.equalToSuperview()
            $0.left.equalToSuperview().offset(15)
        }
    }
}
