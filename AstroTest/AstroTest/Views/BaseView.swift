//
//  BaseView.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class BaseView: UIView {

    private let BORDER_WIDTH_VIEW: CGFloat = 1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            self.layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.layer.borderWidth = BORDER_WIDTH_VIEW
        }
    }
    
    @IBInspectable var defaultStyle: Bool? {
        didSet {
            self.layer.borderColor = UIColor.clear.cgColor
            self.layer.cornerRadius = 0
            self.layer.borderWidth = 0
        }
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        if let value = value as? Bool?, key == "defaultStyle" {
            self.defaultStyle = value
        }
    }
    
    
    public func setupUI() {
        self.clipsToBounds = true
        self.backgroundColor = UIColor.clear
    }

}
