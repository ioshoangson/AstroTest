//
//  UIViewController.swift
//  AstroTest
//
//  Created by HOANGSON on 10/28/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

extension UIViewController {
    
    public func slideMenuViewController() -> UIViewController? {
        let rootViewController = APP_DELEGATE.window?.rootViewController
        if rootViewController is SlideMenuViewController {
            return rootViewController as! SlideMenuViewController
        }
        return nil
    }
}
