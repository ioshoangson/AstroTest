//
//  MenuFooterView.swift
//  AstroTest
//
//  Created by HOANGSON on 10/29/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class MenuFooterView: BaseView {

    
    public var logoutAction: (() -> Void)?
    
    @IBAction private func logoutAction(sender: AnyObject) {
        if self.logoutAction != nil {
            self.logoutAction!()
            self.logoutAction = nil
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
        let menuFooterView: UIView = (Bundle.main.loadNibNamed("MenuFooterView", owner: self, options: nil)?.first as? UIView)!
        menuFooterView.frame = self.bounds
        self.addSubview(menuFooterView)
    }
    
}
