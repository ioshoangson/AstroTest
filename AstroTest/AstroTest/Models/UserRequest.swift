//
//  UserRequest.swift
//  AstroTest
//
//  Created by HOANGSON on 10/28/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class UserRequest: NSObject {
    
    static let shareInstance = UserRequest()
    
    public typealias CompletionBlock = (Bool) -> Void
    
    public func logout(completion: CompletionBlock) {
        DispatchQueue.main.async {
            LocalDataManager.shareInstance.removeListFavoritesChannel()
            FirebaseDatamanager.shareInstance.removeListFavoritesChannel()
            FirebaseDatamanager.shareInstance.removeSortChannelBy()
        }
    }

}
