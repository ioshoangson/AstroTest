//
//  ConfigTableView.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class ConfigTableView: NSObject {
    private(set) var dataSource: [AnyObject] = []
    private(set) var configTableViewLayout: ConfigTableViewLayout?
    
    convenience init(dataSources: [AnyObject], configTableViewLayout: ConfigTableViewLayout) {
        self.init()
        self.dataSource = dataSources
        self.configTableViewLayout = configTableViewLayout
    }

}
