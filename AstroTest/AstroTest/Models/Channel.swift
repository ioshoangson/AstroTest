//
//  Channel.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class Channel: BaseObject, NSCoding {
    
    private(set) var channelId: Int?
    private(set) var channelStbNumber: Int?
    private(set) var channelTitle: String?
    private(set) var isFavorites: Bool = false
    
    
    init(channelId: Int,
         channelStbNumber: Int,
         channelTitle: String,
         isFavorites: Bool) {
        self.channelId = channelId
        self.channelStbNumber = channelStbNumber
        self.channelTitle = channelTitle
        self.isFavorites = isFavorites
    }
    
    
    required  init(coder decoder: NSCoder) {
        self.channelId = decoder.decodeObject(forKey: "channelId") as? Int
        self.channelStbNumber = decoder.decodeObject(forKey: "channelStbNumber") as? Int
        self.channelTitle = decoder.decodeObject(forKey: "channelTitle") as? String
        self.isFavorites = decoder.decodeBool(forKey: "isFavorites")
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(channelId, forKey: "channelId")
        coder.encode(channelStbNumber, forKey: "channelStbNumber")
        coder.encode(channelTitle, forKey: "channelTitle")
        coder.encode(isFavorites, forKey: "isFavorites")
    }
    
    public func setFavorite(isFavorites: Bool) {
        self.isFavorites = isFavorites
    }
    
    
    override func parseData() {
        
    }
}
