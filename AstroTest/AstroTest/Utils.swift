//
//  Utils.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class Utils: NSObject {
    
    static func getCurrentTime() -> String {
        let date = Date()
        return Utils.getStringFromDate(date: date)
    }
    
    static func sevenDaysfromNow() -> Date {
        return (Calendar.current as NSCalendar).date(byAdding: .day, value: 7, to: Date(), options: [])!
    }
    
    static func getNextDayFromCurrentDay() -> Date {
        return (Calendar.current as NSCalendar).date(byAdding: .day, value: 1, to: Date(), options: [])!
    }

    static func getStringFromDate(date: Date) -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    static func getPeriodEnd(date: Date) -> String {
        let dateString = self.getStringFromDate(date: date)
        var firstElement = dateString.components(separatedBy: " ").first
        firstElement?.append(" 23:59")
        return firstElement!
    }
    
    static func getPeriodStart(date: Date) -> String {
        let dateString = self.getStringFromDate(date: date)
        var firstElement = dateString.components(separatedBy: " ").first
        firstElement?.append("23:59")
        return firstElement!
    }
}
