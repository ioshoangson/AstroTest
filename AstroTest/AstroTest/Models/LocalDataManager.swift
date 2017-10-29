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
    
    public override func storeFavoritesChannels(channels: AnyObject) {
        let data = self.encodeData(data: channels)
        self.saveDataToLocalWithKey(data: data, key: FAVORITES)
    }
    
    public override func getListFavoritesChannel() -> AnyObject {
       let saved = self.getLocalDataWithKey(key: FAVORITES)
       return saved
    }
    
    public override func removeListFavoritesChannel() {
        self.removeLocalStorageWithKey(key: FAVORITES)
    }
    
    
    public func removeChannel(channel: Channel) {
        var favories = self.getListFavoritesChannel() as? Array<Channel>
        if self.checkChannelExists(channel: channel) {
            favories = favories?.filter { $0.channelId != channel.channelId }
        }
        self.storeFavoritesChannels(channels: favories as AnyObject)
    }
    
    
    public func checkChannelExists(channel: Channel) -> Bool {
        let favories = self.getListFavoritesChannel() as? Array<Channel>
        if favories != nil && (favories?.count)! > 0 {
            return (favories?.contains(where: { $0.channelId == channel.channelId }))!
        }
        return false
    }
}
