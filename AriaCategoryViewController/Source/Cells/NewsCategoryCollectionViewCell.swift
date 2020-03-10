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
    
    var isEdit: Bool! {
        didSet {
            if section == 0 {
                deleteButton.isHidden = !isEdit
            } else {
                deleteButton.isHidden = true
            }
        }
    }
    
    var deleteCallback: (() -> ())?
    
    var section: Int!
    
    // MARK: 控件
    fileprivate lazy var titleLabel = UILabel().then {
        $0.textColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).textAlignment(.center).font(.systemFont(ofSize: 13))
    }
    
    fileprivate lazy var deleteButton = UIButton().then {
        $0.image(#imageLiteral(resourceName: "login_clear"), for: .normal, .highlighted).tap { [weak self] in
            guard let `self` = self, let block = self.deleteCallback else { return }
            block()
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

extension NewsCategoryCollectionViewCell {
    fileprivate func setupView() {
        contentView.cornerRadius(7).backgroundColor(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1))
        contentView.clipsToBounds = false
        
        titleLabel.addToSuperview(contentView).makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        deleteButton.addToSuperview(contentView).makeConstraints {
            $0.top.equalToSuperview().offset(-5)
            $0.right.equalToSuperview().offset(5)
            $0.height.width.equalTo(15)
        }
    }
}
