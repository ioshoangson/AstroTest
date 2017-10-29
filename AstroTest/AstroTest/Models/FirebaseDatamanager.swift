//
//  FirebaseDatamanager.swift
//  AstroTest
//
//  Created by HOANGSON on 10/28/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit
import FirebaseDatabase

enum SortChannelBy: String {
    case number = "number"
    case name = "name"
    case numberAndFavorites = "numberAndFavorites"
    case nameAndFavorites = "nameAndFavorites"
}

class FirebaseDataManager: DataManager {
    
    static let shareInstance = FirebaseDataManager()
    
    public typealias CompletionBlock = (AnyObject) -> Void

    private var ref: DatabaseReference!

    override init() {
        super.init()
        self.ref = Database.database().reference()
    }
    
    override func storeFavoritesChannels(channels: AnyObject) {
        let dict = ChannelParams.channelToJSON(channel: channels as! Channel)
        self.ref.child(FAVORITES).childByAutoId().setValue(dict)
    }
    
    public func getListFavoritesChannel(completion: @escaping CompletionBlock) {
        var data = [Dictionary<String, String>]()
        self.ref.child(FAVORITES).observe(.childAdded, with: { (snapshot) in
            let fav = snapshot.value as! NSDictionary
            data.append(fav as! Dictionary<String, String>)
            completion(data as AnyObject)
        })
    }

    override func removeListFavoritesChannel() {
        self.ref.child(FAVORITES).removeValue()
    }
    
    
    public func storeSortChannelsBy(sortBy: SortChannelBy) {
        self.ref.child(SORT_BY).child(SORT_TYPE).setValue(sortBy.rawValue)
    }
    
    public func removeSortChannelBy() {
        self.ref.child(SORT_BY).removeValue()
    }
    
}
