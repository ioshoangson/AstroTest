//
//  TVGuideViewController.swift
//  AstroTest
//
//  Created by HOANGSON on 10/29/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class TVGuideContentView: HomeContentView {
    override func setupCollectionView() {
        self.registerNibCell(nibName: "TVGuideCollectionViewCell", cellIdentifier: "TVGuideCollectionViewCellIdentifier", collectionView: self.contentCollectionView!)
    }
}


class TVGuideViewController: BaseViewController {
    
    @IBOutlet weak private var tvGuideContentView: TVGuideContentView?
    private var dataSource = [TVGuide]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func initData() {
        TVGuideRequest.shareInstance.getCurrentShowForAllChannels(context: self, channelId: Application.shareInstance.listChannelsId!, periodStart: Utils.getCurrentTime(), periodEnd: Utils.getPeriodEnd(date: Date())) { (success, data) in
            self.dataSource = data as! [TVGuide]
            self.tvGuideContentView?.setDataSource(dataSource: self.dataSource as AnyObject)
        }
    }
    
}
