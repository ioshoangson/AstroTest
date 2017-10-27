//
//  BaseTableViewCell.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

@objc protocol TableViewCellDelegate: class {
    //Base protocol
}


class BaseTableViewCell: UITableViewCell {

    @IBOutlet private(set) var iconImageView: UIImageView?
    @IBOutlet private(set) var titleLabel: UILabel?
    
    public weak var delegate: TableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
