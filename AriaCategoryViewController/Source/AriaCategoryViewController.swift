//
//  AriaCategoryViewController.swift
//  VideoMoments
//
//  Created by 神崎H亚里亚 on 2020/3/6.
//  Copyright © 2020 Future Studio. All rights reserved.
//

import UIKit
import Then
import RxSwift
import RxDataSources
import NSObject_Rx
import AriaSwiftyChain
import Reusable

public class AriaCategoryViewController: UIViewController {
    open var callback: (([String]) -> ())?
    
    // MARK: - 变量
    fileprivate let ScreenWidth = UIScreen.main.bounds.width
    
    fileprivate var isEdit = false
    
    fileprivate lazy var dataListArr = BehaviorSubject(value: [AnimatableSectionModel<String, String>]())
    
    open var dataSource: ((String?, [String]), (String?, [String]))! {
        didSet {
            dataListArr.onNext([
                AnimatableSectionModel<String, String>(model: dataSource.0.0 ?? "切换栏目", items: dataSource.0.1),
                AnimatableSectionModel<String, String>(model: dataSource.1.0 ?? "点击切换更多栏目", items: dataSource.1.1.filter { a in !dataSource.0.1.contains { b in b == a } })
                ]
            )
        }
    }
    
    // MARK: - 控件
    fileprivate lazy var layout = UICollectionViewFlowLayout().then {
        $0.headerReferenceSize = CGSize(width: ScreenWidth, height: 40)
        $0.itemSize = CGSize(width: (ScreenWidth - 15 * 5) / 4, height: 30)
        $0.minimumLineSpacing = 15
        $0.minimumInteritemSpacing = 15
        $0.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
    
    fileprivate lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        cv.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
        cv.register(supplementaryViewType: NewsCategoryHeaderView.self, ofKind: UICollectionView.elementKindSectionHeader)
        cv.register(cellType: NewsCategoryCollectionViewCell.self)
        return cv
    }()
}

extension AriaCategoryViewController {
    fileprivate func setupView() {
        edgesForExtendedLayout = .bottom
        
        view.backgroundColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.topItem?.title = ""
        navigationItem.title = "分类管理"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "编辑", style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem?.rx.tap.bind { [weak self] in
            guard let `self` = self else { return }
            self.isEdit = !self.isEdit
            self.navigationItem.rightBarButtonItem?.title = self.isEdit ? "完成" : "编辑"
            self.collectionView.reloadData()
        }.disposed(by: rx.disposeBag)
        
        collectionView.addToSuperview(view).makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        let dataSource = RxCollectionViewSectionedAnimatedDataSource<AnimatableSectionModel<String, String>>(animationConfiguration: AnimationConfiguration(insertAnimation: .top, reloadAnimation: .fade, deleteAnimation: .left), configureCell: { (_, cv, ip, element) -> UICollectionViewCell in
            let cell = cv.dequeueReusableCell(for: ip, cellType: NewsCategoryCollectionViewCell.self)
            cell.model = element
            cell.section = ip.section
            cell.isEdit = self.isEdit
            cell.deleteCallback = { [weak self] in
                guard let `self` = self else { return }
                self.collectionView.selectItem(at: ip, animated: true, scrollPosition: .top)
            }
            return cell
        }, configureSupplementaryView: { (ds, cv, kind, ip) -> UICollectionReusableView in
            let view = cv.dequeueReusableSupplementaryView(ofKind: kind, for: ip, viewType: NewsCategoryHeaderView.self)
            view.model = ds[ip.section].model
            return view
        }, moveItem: { [weak self] (ds, sourceIndexPath, destinationIndexPath) in
            print("move from:\(sourceIndexPath) to:\(destinationIndexPath)")
            guard let `self` = self else { return }
            guard var arr = try? self.dataListArr.value() else { return }
            if destinationIndexPath.row == 0 {
                let item = self.dataSource.0.1[sourceIndexPath.row]
                self.dataSource.0.1.remove(at: sourceIndexPath.row)
                self.dataSource.0.1.insert(item, at: 0)
                
                arr[0].items.remove(at: sourceIndexPath.row)
                arr[0].items.insert(item, at: 0)
            } else if destinationIndexPath.row == arr[0].items.count - 1 {
                let item = self.dataSource.0.1[sourceIndexPath.row]
                self.dataSource.0.1.remove(at: sourceIndexPath.row)
                self.dataSource.0.1.insert(item, at: destinationIndexPath.row)
                
                arr[0].items.remove(at: sourceIndexPath.row)
                arr[0].items.insert(item, at: destinationIndexPath.row)
            } else {
                self.dataSource.0.1.exchangeValue(sourceIndexPath.row, destinationIndexPath.row)
                arr[0].items.exchangeValue(sourceIndexPath.row, destinationIndexPath.row)
            }
            self.dataListArr.onNext(arr)
        }, canMoveItemAtIndexPath: { (_, ip) in
            return ip.section == 0
        })
        dataListArr.asObserver().bind(to: collectionView.rx.items(dataSource: dataSource)).disposed(by: rx.disposeBag)
        
        let ges = UILongPressGestureRecognizer()
        collectionView.addGestureRecognizer(ges)
        
        ges.rx.event.subscribe(onNext: { [weak self] (longPress) in
            guard let `self` = self else { return }
            switch longPress.state {
            case .began:
                guard let indexPath = self.collectionView.indexPathForItem(at: longPress.location(in: self.collectionView)) else { break }
                self.collectionView.beginInteractiveMovementForItem(at: indexPath)
            case .changed:
                let targetPosition = longPress.location(in: self.collectionView)
                if let destinationPosition = self.collectionView.supplementaryView(forElementKind: UICollectionView.elementKindSectionHeader, at: IndexPath(row: 0, section: 1))?.frame.origin {
                    if targetPosition.y >= destinationPosition.y {
                        self.collectionView.endInteractiveMovement()
                        break
                    }
                }
                self.collectionView.updateInteractiveMovementTargetPosition(targetPosition)
            case .ended:
                self.collectionView.endInteractiveMovement()
            default: self.collectionView.cancelInteractiveMovement()
            }
        }).disposed(by: rx.disposeBag)
        
        collectionView.rx.itemSelected.bind { [weak self] (ip) in
            guard let `self` = self else { return }
            guard var arr = try? self.dataListArr.value() else { return }
            
            if let cell = self.collectionView.cellForItem(at: ip) as? NewsCategoryCollectionViewCell {
                cell.section = ip.section == 0 ? 1 : 0
                cell.deleteButton.isHidden = !(cell.section == 0 && self.isEdit)
            }
            
            if ip.section == 0 {
                self.dataSource.0.1.remove(at: ip.row)
                
                arr[1].items.append(arr[0].items[ip.row])
                arr[0].items.remove(at: ip.row)
            } else {
                self.dataSource.0.1.append(arr[1].items[ip.row])
                
                arr[0].items.append(arr[1].items[ip.row])
                arr[1].items.remove(at: ip.row)
            }
            self.dataListArr.onNext(arr)
        }.disposed(by: rx.disposeBag)
    }
}

public extension AriaCategoryViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
        
        print("[AriaCategoryViewController]: deinit")
        guard let block = callback else { return }
        block(self.dataSource.0.1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}
