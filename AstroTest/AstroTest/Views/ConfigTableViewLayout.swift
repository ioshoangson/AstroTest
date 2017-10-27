//
//  ConfigTableViewLayout.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

enum TableViewStyle {
    case plain
    case group
}

class ConfigTableViewLayout: NSObject {
    private(set) var heightCell: CGFloat = 0
    private(set) var tableViewStyle: TableViewStyle = .plain
    
    convenience init(heightCell: CGFloat, tableViewStyle: TableViewStyle) {
        self.init()
        self.heightCell = heightCell
        self.tableViewStyle = tableViewStyle
    }
}
