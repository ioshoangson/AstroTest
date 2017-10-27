//
//  SortChannel.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class SortChannel: NSObject {
    
    static public func sortByChannelNumber(array: Array<Channel>) -> Array<Channel>{
        return array.sorted { $0.channelId! < $1.channelId! }
    }

    
    static public func sortByChannelName(array: Array<Channel>) -> Array<Channel>{
        return array.sorted { $0.channelTitle! < $1.channelTitle! }
    }
    
}