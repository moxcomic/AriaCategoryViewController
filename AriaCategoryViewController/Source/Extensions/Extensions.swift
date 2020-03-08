//
//  Extensions.swift
//  AriaCategoryViewController
//
//  Created by 神崎H亚里亚 on 2020/3/8.
//  Copyright © 2020 moxcomic. All rights reserved.
//

import UIKit
import Reusable
import RxSwift
import RxDataSources
import RxCocoa

extension UICollectionViewCell: Reusable {}
extension UICollectionReusableView: Reusable {}

extension Array {
    mutating func exchangeValue(_ a: Int, _ b: Int) {
        (self[a], self[b]) = (self[b], self[a])
    }
}

extension Reactive where Base: UICollectionView {
    func castOrThrow<T>(_ resultType: T.Type, _ object: Any) throws -> T {
        guard let returnValue = object as? T else {
            throw RxCocoaError.castingError(object: object, targetType: resultType)
        }

        return returnValue
    }
    
    @available(iOS 9.0, *)
    public var moveItemAt: ControlEvent<(sourceIndexPath: IndexPath, destinationIndexPath: IndexPath)> {
        let source: Observable<(sourceIndexPath: IndexPath, destinationIndexPath: IndexPath)> = dataSource.methodInvoked(#selector(UICollectionViewDataSource.collectionView(_:moveItemAt:to:)))
            .map { a in
                return try (self.castOrThrow(IndexPath.self, a[1]), self.castOrThrow(IndexPath.self, a[2]))
        }
        return ControlEvent(events: source)
    }
}
