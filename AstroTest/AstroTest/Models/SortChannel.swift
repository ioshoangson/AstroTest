//
//  SortChannel.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class SortChannel: NSObject {
    
    public typealias SortByChannelNumberBlock = () -> Void
    public typealias SortByChannelNameBlock = () -> Void

    static public func sortByChannelNumber(array: Array<Channel>) -> Array<Channel>{
        return array.sorted { $0.channelId! < $1.channelId! }
    }

    
    static public func sortByChannelName(array: Array<Channel>) -> Array<Channel>{
        return array.sorted { $0.channelTitle! < $1.channelTitle! }
    }
    
    static public func sortByFavoriteAndChannelName(array: Array<Channel>) -> Array<Channel>{
        return array.sorted { $0.channelTitle! < $1.channelTitle! && $0.isFavorites == true}
    }
    
    static public func sortByFavoriteAndChannelNumber(array: Array<Channel>) -> Array<Channel>{
        return array.sorted { $0.channelId! < $1.channelId! && $0.isFavorites == true}
    }
    
    
    static func showSortByOptionInViewController(controller: UIViewController,
                                                 sortByChannelNameBlock: @escaping SortByChannelNameBlock,
                                                 sortByChannelNumberBlock: @escaping SortByChannelNumberBlock) {
        let actionSheetController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cancelActionButton = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in }
        actionSheetController.addAction(cancelActionButton)
        
        let sortByChannelNumberActionButton = UIAlertAction(title: "Sort By Channel Number", style: .default) { action -> Void in
            sortByChannelNumberBlock()
        }
        actionSheetController.addAction(sortByChannelNumberActionButton)
        
        let sortByChannelNameActionButton = UIAlertAction(title: "Sort By Channel Name", style: .default) { action -> Void in
            sortByChannelNameBlock()
        }
        actionSheetController.addAction(sortByChannelNameActionButton)
        controller.present(actionSheetController, animated: true, completion: nil)
    }
}
