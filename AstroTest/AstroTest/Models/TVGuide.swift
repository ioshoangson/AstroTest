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
    private(set) var isOnNow: Bool?
    
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
        self.isOnNow = self.showOnNow()
    }
    
    public func getLocalTimeFromUTC() -> String{
        return Utils.UTCToLocal(date: self.displayDateTimeUtc!)
    }
    
    private func showOnNow() -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.S"
        let startShowDate = dateFormatter.date(from: self.displayDateTime!)
        
        
        let calendar = NSCalendar.autoupdatingCurrent
        let durations = self.displayDuration?.components(separatedBy: ":")
        let hour = Int((durations?.first)!)
        let minute = Int((durations?[1])!)
        var endShowDate = calendar.date(byAdding: .hour, value: hour!, to: startShowDate!)
        endShowDate = calendar.date(byAdding: .minute, value: minute!, to: startShowDate!)

        let date = Date()

        print(Utils.getStringFromDate(date: startShowDate!))
        print(Utils.getStringFromDate(date: endShowDate!))
        print(Utils.getStringFromDate(date: date))
        
        return Utils.isBetweenDates(date: date, beginDate: startShowDate!, endDate: endShowDate!)
    }
    
    
    public func getDisplayTime() -> String {
        return (self.displayDateTime?.components(separatedBy: " ").last)!
    }
}

