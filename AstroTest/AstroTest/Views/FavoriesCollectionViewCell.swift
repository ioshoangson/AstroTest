//
//  FavoriesCollectionViewCell.swift
//  AstroTest
//
//  Created by HOANGSON on 10/29/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class FavoriesCollectionViewCell: BaseCollectionViewCell {
    @IBOutlet private(set) var channelTitle: UILabel?
    
    override func updateData(data: AnyObject) {
        let channel = data as? Channel
        self.channelTitle?.text = channel?.channelTitle
    }

}
