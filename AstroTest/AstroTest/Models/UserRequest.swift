//
//  UserRequest.swift
//  AstroTest
//
//  Created by HOANGSON on 10/28/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class UserRequest: NSObject {
    
    static let shareInstance = UserRequest()
    
    public typealias CompletionBlock = (Bool) -> Void
    
    public func logout(completion: @escaping CompletionBlock) {
        DispatchQueue.main.async {
            FBSDKLoginManager().logOut()
            GIDSignIn.sharedInstance().signOut()

            LocalDataManager.shareInstance.removeListFavoritesChannel()
            FirebaseDataManager.shareInstance.removeListFavoritesChannel()
            FirebaseDataManager.shareInstance.removeSortChannelBy()
            
            completion(true)
        }
    }

}
