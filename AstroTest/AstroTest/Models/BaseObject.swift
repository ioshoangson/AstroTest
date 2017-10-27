//
//  BaseObject.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class BaseObject: NSObject {
    private(set) var jsonData: NSDictionary? = [:]
    
    convenience init(jsonData: NSDictionary) {
        self.init()
        self.jsonData = jsonData
        self.parseData()
    }
    
    public func parseData() {
        
    }
}
