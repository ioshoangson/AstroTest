//
//  TVGuideDateView.swift
//  AstroTest
//
//  Created by 352SonDH2-MC on 10/30/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit


class TVGuideDateView: BaseView {
    
    let LIMIT_INDEX = 7
    
    @IBOutlet weak private(set) var dateLabel: UILabel?
    @IBOutlet weak private var previousButton: UIButton?
    @IBOutlet weak private var nextButton: UIButton?
    
    private var currentIndex: Int = 0

    var didSelectDate:(UIButton, Int) -> Void = {
        (button: UIButton, index: Int) -> Void in
    }
    
    public func updateDateLabel(date: String) {
        self.dateLabel?.text = date
    }
    
    @IBAction func pressButtonAction(sender: AnyObject) {
        let button = sender as! UIButton
        if button == self.previousButton {
            self.currentIndex = self.currentIndex > 0 ? self.currentIndex - 1 : 0
            self.didSelectDate(self.previousButton!, self.currentIndex)
        }else {
            self.currentIndex = self.currentIndex == LIMIT_INDEX ? LIMIT_INDEX : self.currentIndex + 1
            self.didSelectDate(self.nextButton!, self.currentIndex)
        }
    }
    
}
