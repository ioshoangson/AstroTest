//
//  ConfigCollectionView.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class ConfigCollectionView: NSObject {
    private(set) var dataSource: [AnyObject] = []
    private(set) var collectionViewFlowLayout: ConfigCollectionViewFlowLayout?
    
    convenience init(dataSources: [AnyObject], collectionViewFlowLayout: ConfigCollectionViewFlowLayout) {
        self.init()
        self.dataSource = dataSources
        self.collectionViewFlowLayout = collectionViewFlowLayout
    }
    
    public func setDataSource(dataSource: [AnyObject]) {
        self.dataSource = dataSource
    }
}
