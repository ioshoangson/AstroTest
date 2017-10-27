//
//  ConfigCollectionViewFlowLayout.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class ConfigCollectionViewFlowLayout: NSObject {
    private(set) var minimumLineSpacingForSection: CGFloat?
    private(set) var minimumInteritemSpacingForSection: CGFloat?
    private(set) var insetForSection: UIEdgeInsets?
    
    public var itemSize: CGSize = CGSize()
        
    convenience init(minimumLineSpacingForSection: CGFloat,
                     minimumInteritemSpacingForSection: CGFloat,
                     insetForSection: UIEdgeInsets) {
        self.init()
        self.minimumLineSpacingForSection = minimumLineSpacingForSection
        self.minimumInteritemSpacingForSection = minimumInteritemSpacingForSection
        self.insetForSection = insetForSection
    }
}
