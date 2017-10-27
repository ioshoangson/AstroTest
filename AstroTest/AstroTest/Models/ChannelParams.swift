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

    static public func channelDetail(channelId: Int) -> NSDictionary {
        return [CHANNEL_ID: String(channelId)];
    }
}
