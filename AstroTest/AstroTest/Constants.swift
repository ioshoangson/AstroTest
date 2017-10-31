//
//  Constants.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

let APP_DELEGATE = UIApplication.shared.delegate as! AppDelegate


class Constants: NSObject {
    //Enable Log Request
    static let ENABLE_LOG_REQUEST = true
    
    static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    static let MAIN_BACKGROUND_COLOR = UIColor.init(colorLiteralRed: 250/255, green: 250/255, blue: 250/255, alpha: 1)
    
    //Storyboard Name
    static let MAIN_STORYBOARD_NAME = "Main"
    
    static let STATUS_CODE_200 = 200
    static let STATUS_CODE_404 = 404
    
    static let GOOGLE_LOGIN_NOTIFICATION = "GoogleLoginNotification"
    static let FINISH_LOAD_CHANNEL_LIST_NOTIFICATION = "ChannelsListNotification"

}
