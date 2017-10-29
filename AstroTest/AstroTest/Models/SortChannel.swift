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
    public typealias SortByChannelNumberAndFavoritesBlock = () -> Void
    public typealias SortByChannelNameAndFavoritesBlock = () -> Void
    
    static public func sortByChannelNumber(array: Array<Channel>) -> Array<Channel>{
        return array.sorted { $0.channelId! < $1.channelId! }
    }

    
    static public func sortByChannelName(array: Array<Channel>) -> Array<Channel>{
        return array.sorted { $0.channelTitle! < $1.channelTitle! }
    }
    
    static public func sortByFavoriteAndChannelName(array: Array<Channel>) -> Array<Channel>{
        let sortByChannelName = SortChannel.sortByChannelName(array: array) as Array<Channel>
        return sortByChannelName.filter { $0.isFavorites == true }
    }
    
    static public func sortByFavoriteAndChannelNumber(array: Array<Channel>) -> Array<Channel>{
        let sortByChannelNumber = SortChannel.sortByChannelNumber(array: array) as Array<Channel>
        return sortByChannelNumber.filter { $0.isFavorites == true }
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
    
    static func showSortByOptionInViewController(controller: UIViewController,
                                                 sortByChannelNameBlock: @escaping SortByChannelNameBlock,
                                                 sortByChannelNumberBlock: @escaping SortByChannelNumberBlock,
                                                 sortByChannelNumberAndFavoritesBlock: @escaping SortByChannelNumberAndFavoritesBlock, sortByChannelNameAndFavoritesBlock: @escaping SortByChannelNameAndFavoritesBlock) {
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
        
        
        let sortByChannelNameAndFavoritesActionButton = UIAlertAction(title: "Sort By Channel Name And Favorites", style: .default) { action -> Void in
            sortByChannelNameAndFavoritesBlock()
        }
        actionSheetController.addAction(sortByChannelNameAndFavoritesActionButton)
        
        
        let sortByChannelNumberAndFavoritesActionButton = UIAlertAction(title: "Sort By Channel Number And Favorites", style: .default) { action -> Void in
            sortByChannelNumberAndFavoritesBlock()
        }
        actionSheetController.addAction(sortByChannelNumberAndFavoritesActionButton)
        
        
        controller.present(actionSheetController, animated: true, completion: nil)
    }
    
}
