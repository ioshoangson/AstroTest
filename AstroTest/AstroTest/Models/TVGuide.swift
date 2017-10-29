//
//  TVGuide.swift
//  AstroTest
//
//  Created by HOANGSON on 10/29/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class TVGuide: BaseObject {
    private(set) var channel: Channel?
    private(set) var displayDateTime: String?
    private(set) var displayDateTimeUtc: String?
    private(set) var displayDuration: String?
    private(set) var genre: String?
    private(set) var programmeTitle: String?
    private(set) var shortSynopsis: String?
    private(set) var subGenre: String?
    private(set) var live: Bool?
    private(set) var eventID: Int?
    
    override func parseData() {
        self.channel = Channel(channelId: self.jsonData?["channelId"] as! Int,
                               channelStbNumber: Int(self.jsonData?["channelStbNumber"] as! String)!,
                               channelTitle: self.jsonData?["channelTitle"] as! String,
                               isFavorites: false)
        self.displayDateTime = self.jsonData?["displayDateTime"] as? String
        self.displayDateTimeUtc = self.jsonData?["displayDateTimeUtc"] as? String
        self.displayDuration = self.jsonData?["displayDuration"] as? String
        self.genre = self.jsonData?["genre"] as? String
        self.programmeTitle = self.jsonData?["programmeTitle"] as? String
        self.shortSynopsis = self.jsonData?["shortSynopsis"] as? String
        self.subGenre = self.jsonData?["subGenre"] as? String
        self.shortSynopsis = self.jsonData?["shortSynopsis"] as? String
        self.live = self.jsonData?["live"] as? Bool
        self.eventID = self.jsonData?["eventID"] as? Int
    }
    
    public func getLocalTimeFromUTC() -> String{
        return Utils.UTCToLocal(date: self.displayDateTimeUtc!)
    }
    
    public func isOnShowOnNow() -> Bool {
        return true
    }
}

