//
//  LocalDataManager.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class LocalDataManager: DataManager {
    
    let FAV_KEY = "fav"
    
    static let shareInstance = LocalDataManager()
    
    public func storeFavoritesChannels(channels: AnyObject) {
        let data = self.encodeData(data: channels)
        self.saveDataToLocalWithKey(data: data, key: FAV_KEY)
    }
    
    public func getListFavoritesChannel() -> AnyObject {
       let saved = self.getLocalDataWithKey(key: FAV_KEY)
       return saved
    }
    
    public func removeListFavoritesChannel() {
        self.removeLocalStorageWithKey(key: FAV_KEY)
    }
    
}
