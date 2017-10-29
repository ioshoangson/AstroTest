//
//  Menu.swift
//  AstroTest
//
//  Created by HOANGSON on 10/29/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

enum MenuTypes {
    case home
    case channel
    case tvGuide
    case settting
}

class Menu: BaseObject {
    private(set) var titleMenu: String?
    private(set) var menuType: MenuTypes?
    
    convenience init(titleMenu: String, menuType: MenuTypes) {
        self.init()
        self.titleMenu = titleMenu
        self.menuType = menuType
    }
    
}
