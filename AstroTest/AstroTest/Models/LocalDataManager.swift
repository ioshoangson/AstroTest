//
//  LocalDataManager.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class LocalDataManager: DataManager {
    static let shareInstance = LocalDataManager()
    
    public override func storeFavoritesChannel(channel: AnyObject) {
        let data = self.encodeData(data: channel)
        self.saveDataToLocalWithKey(data: data, key: FAVORITES)
    }
    
    public override func getListFavoritesChannel() -> AnyObject {
       let saved = self.getLocalDataWithKey(key: FAVORITES)
       return saved
    }
    
    public override func removeListFavoritesChannel() {
        self.removeLocalStorageWithKey(key: FAVORITES)
    }
    
}
