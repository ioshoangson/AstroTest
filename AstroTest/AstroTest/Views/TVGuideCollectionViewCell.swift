//
//  TVGuideCollectionViewCell.swift
//  AstroTest
//
//  Created by HOANGSON on 10/29/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class TVGuideCollectionViewCell: BaseCollectionViewCell {

    @IBOutlet private(set) var programmeTitleLabel: UILabel?
    @IBOutlet private(set) var genreLabel: UILabel?
    @IBOutlet private(set) var displayDateTimeLabel: UILabel?
    @IBOutlet private(set) var displayDurationLabel: UILabel?
    
    @IBOutlet private(set) var onNowView: UIView?

    override func updateData(data: AnyObject) {
        let tvGuide = data as? TVGuide
        self.programmeTitleLabel?.text = tvGuide?.programmeTitle
        self.genreLabel?.text = tvGuide?.genre
        self.displayDateTimeLabel?.text = tvGuide?.getDisplayTime()
        self.displayDurationLabel?.text = tvGuide?.displayDuration
        self.onNowView?.isHidden = !(tvGuide?.isOnNow)!
    }
}
