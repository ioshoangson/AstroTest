//
//  DataManager.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit


class DataManager: BaseObject {
    let NO_DATA = "0"
    let FAVORITES = "Favorites"
    let SORT_BY = "SortBy"
    let SORT_TYPE = "type"

    public func encodeData(data: AnyObject) -> Data {
        return NSKeyedArchiver.archivedData(withRootObject: data)
    }
    
    public func saveDataToLocalWithKey(data: Data, key: String) {
        let userDefaults: UserDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: key)
        userDefaults.synchronize()
    }
    
    public func getLocalDataWithKey(key: String) -> AnyObject {
        let data = UserDefaults.standard.object(forKey: key)
        if data != nil {
            return NSKeyedUnarchiver.unarchiveObject(with: data as! Data) as AnyObject
        }
        return NO_DATA as AnyObject
    }
    
    
    public func removeLocalStorageWithKey(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    
    public func storeFavoritesChannel(channel: AnyObject) {
        
    }
    
    public func getListFavoritesChannel() -> AnyObject {
        return "Must be override from subclass"  as AnyObject
    }
    
    public func removeListFavoritesChannel() {
    }

}
