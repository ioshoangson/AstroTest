//
//  BaseCollectionViewCell.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

@objc protocol CollectionViewCellDelegate: class {
    @objc func favoriteAction(collectionViewCell: BaseCollectionViewCell)
}

class BaseCollectionViewCell: UICollectionViewCell {
    public weak var delegate: CollectionViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }
    
    //MARK:
    //MARK: - Public Methods
    public func setupUI() {
        
    }
    
    public func updateData(data: AnyObject) {
        
    }
    
    public func configCellAtIndex(index: IndexPath) {
        
    }
}
