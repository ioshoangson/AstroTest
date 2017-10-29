//
//  MenuTableViewCell.swift
//  AstroTest
//
//  Created by HOANGSON on 10/29/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class MenuTableViewCell: BaseTableViewCell {
    @IBOutlet private(set) var selectedView: UIView?
    
    let SELECTED_VIEW_BG = UIColor.red
    let UNSELECTED_VIEW_BG = UIColor.clear

    override func setSelected(_ selected: Bool, animated: Bool) {
        self.setSelectedMenuStyle(selected: selected)
    }
    
    override func updateData(data: AnyObject) {
        let menu: Menu = (data as? Menu)!
        self.titleLabel?.text = menu.titleMenu
    }
    
    private func setSelectedMenuStyle(selected: Bool) {
        self.selectedView?.isHidden = !selected
        self.selectedView?.backgroundColor = selected ? SELECTED_VIEW_BG : UNSELECTED_VIEW_BG
        self.titleLabel?.font = selected ? UIFont.boldSystemFont(ofSize: 15) : UIFont.systemFont(ofSize: 15)
    }
}

