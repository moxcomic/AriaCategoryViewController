//
//  NewsCategoryCollectionViewCell.swift
//  VideoMoments
//
//  Created by 神崎H亚里亚 on 2020/3/6.
//  Copyright © 2020 Future Studio. All rights reserved.
//

import UIKit
import Then
import AriaSwiftyChain

class NewsCategoryCollectionViewCell: UICollectionViewCell {
    // MARK: - 变量
    var model: String! {
        didSet {
            titleLabel.text(model)
        }
    }
    
    var section: Int!
    
    // MARK: 控件
    fileprivate lazy var titleLabel = UILabel().then {
        $0.textColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).textAlignment(.center)
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

extension NewsCategoryCollectionViewCell {
    fileprivate func setupView() {
        contentView.cornerRadius(7).backgroundColor(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1))
        
        titleLabel.addToSuperview(contentView).makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
