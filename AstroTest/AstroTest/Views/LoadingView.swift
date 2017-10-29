//
//  LoadingView.swift
//  AstroTest
//
//  Created by HOANGSON on 10/29/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class LoadingView: BaseView {
    @IBOutlet weak private var activityIndicatorView: UIActivityIndicatorView?
    
    override func setupUI() {        
        self.startAnimation()
    }
    
    private func startAnimation() {
        self.activityIndicatorView?.startAnimating()
    }
    
    private func stopAnimation() {
        self.activityIndicatorView?.stopAnimating()
    }
}
