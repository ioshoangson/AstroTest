//
//  MenuHeader.swift
//  AstroTest
//
//  Created by HOANGSON on 10/29/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class MenuHeader: BaseView {
    public var editProfileAction: (() -> Void)?
    
    
    @IBAction private func editProfileAction(sender: AnyObject) {
        if self.editProfileAction != nil {
            self.editProfileAction!()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadXibFile()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.loadXibFile()
    }
    
    private func loadXibFile() {
        let menuHeaderView: UIView = (Bundle.main.loadNibNamed("MenuHeader", owner: self, options: nil)?.first as? UIView)!
        menuHeaderView.frame = self.bounds
        self.addSubview(menuHeaderView)
    }
    
}
