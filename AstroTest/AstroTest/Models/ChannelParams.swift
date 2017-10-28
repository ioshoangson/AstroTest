//
//  ChannelParams.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class ChannelParams: NSObject {
    static let CHANNEL_ID = "channelId"
    static let CHANNEL_NUMBER = "channelStbNumber"
    static let CHANNEL_TITLE = "channelTitle"
    static let CHANNEL_FAV = "isFavorites"



    static public func channelDetail(channelId: Int) -> NSDictionary {
        return [CHANNEL_ID: String(channelId)];
    }
    
    static public func channelToJSON(channel: Channel) -> NSDictionary {
        return [CHANNEL_ID: String(describing: channel.channelId!),
                CHANNEL_NUMBER: String(describing: channel.channelStbNumber!),
                CHANNEL_TITLE: channel.channelTitle!,
                CHANNEL_FAV: channel.isFavorites ? "true" : "false"]
    }
}
