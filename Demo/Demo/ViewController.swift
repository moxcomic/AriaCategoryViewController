//
//  ViewController.swift
//  Demo
//
//  Created by 神崎H亚里亚 on 2020/3/9.
//  Copyright © 2020 moxcomic. All rights reserved.
//

import UIKit
import AriaCategoryViewController
import Then

class ViewController: UIViewController {

    fileprivate lazy var vc = AriaCategoryViewController().then {
        $0.dataSource = ((nil, ["1", "2", "3", "4"]), (nil, ["1", "2", "3", "4", "5", "6", "7", "8"]))
        
        $0.callback = { (result) in
            print("选择结果:\(result)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vc.view.addToSuperview(view).makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        addChild(vc)
    }
}

