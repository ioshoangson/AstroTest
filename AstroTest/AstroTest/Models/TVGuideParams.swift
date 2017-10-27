//
//  TVGuideParams.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class TVGuideParams: NSObject {
    
    static let PERIOD_START = "periodStart"
    static let PERIOD_END = "periodEnd"
    static let LIVE = "live"
    static let CHANNEL_ID = "channelId"
    static let VALUE_LIVE = "true"
    
    static public func channelDetail(channelId: Array<String>, periodStart: String, periodEnd: String, isLive: Bool) -> NSDictionary {
        let listChannelsId = String(channelId.joined(separator: ","))
   
        return [PERIOD_START: periodStart,
                CHANNEL_ID: listChannelsId!,
                PERIOD_END: periodEnd,
                LIVE: isLive ? "true" : "false"];
    }
    
}
