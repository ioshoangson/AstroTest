//
//  ChannelTableViewCell.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

@objc protocol ChannelTableViewCellDelegate: TableViewCellDelegate {
    @objc optional func favoritesAction(channel: Channel, channelTableViewCell: BaseTableViewCell)
}


class ChannelTableViewCell: BaseTableViewCell {
    
   @IBOutlet private(set) var channelTitle: UILabel?
   @IBOutlet private(set) var favoritesImageView: UIImageView?
    
    private var channel: Channel?
    
    override func updateData(data: AnyObject) {
        self.channel = data as? Channel
        self.channelTitle?.text = self.channel?.channelTitle
        self.favoritesImageView?.image = UIImage(named: (self.channel?.isFavorites)! ? "fav_red_icon" : "fav_black_icon")
    }
    
    @IBAction func favoritesAction(sender: AnyObject) {
        if self.delegate != nil {
            (self.delegate as! ChannelTableViewCellDelegate).favoritesAction!(channel: self.channel!, channelTableViewCell: self)
        }
    }
}
