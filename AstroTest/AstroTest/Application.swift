//
//  Application.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class Application: NSObject {
    
    static let shareInstance = Application()
    var listChannelsId: Array<String>?
    
    public func isLogin() -> Bool {
        return (FBSDKAccessToken.current() != nil) ||  (GIDSignIn.sharedInstance().currentUser != nil)
    }
}

