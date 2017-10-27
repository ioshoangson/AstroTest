//
//  API.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class API: NSObject {
    
    //MARK:
    //MARK: - Server URL
    static let SERVER_PRODUCT_URL = "http://ams-api.astro.com.my/"
    static let SERVER_DEV_URL = "http://ams-api.astro.com.my/"
    
    //MARK:
    //MARK: - Channel List
    static let CHANNEL_LIST = "ams/v3/getChannelList"
    static let DETAIL_CHANNEL = "ams/v3/getChannels"
    
    //MARK:
    //MARK: - TV Guide
    static let CURRENT_SHOW = "ams/v3/getEvents"

}
