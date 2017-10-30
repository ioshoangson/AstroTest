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
    private var tvGuides = [TVGuide]()
    private var tvGuideDateView: TVGuideDateView?
    private var periodStart: String?
    private var periodEnd: String?
    
    let channelsId = ["1","2","3","4","5","6","7","8","9","10"] as Array<String>
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func setupUI() {
        super.setupUI()
        self.loadTVGuideDateView()
        self.addSortButton()
    }
    
    private func loadTVGuideDateView() {
        self.tvGuideDateView = (Bundle.main.loadNibNamed("TVGuideDateView", owner: self, options: nil)?.first as? TVGuideDateView)!
        self.tvGuideDateView?.didSelectDate = {
            (button: UIButton, index: Int) -> Void in
            let nextDay = Utils.getNextDayFromCurrentDay(date: Date(), value: index)
            self.tvGuideDateView?.updateDateLabel(date: Utils.getStringFromDate(date: nextDay))
            
            //Get params
            self.periodStart = Utils.getStringFromDate(date: nextDay)
            self.periodEnd = Utils.getPeriodEnd(date: nextDay)
            self.requestData(periodStart: self.periodStart!, periodEnd: self.periodEnd!)
        }
        self.tvGuideDateView?.updateDateLabel(date: Utils.getCurrentTime())
        self.navigationItem.titleView = self.tvGuideDateView
    }
    
    override func initData() {
        self.periodStart = Utils.getCurrentTime()
        self.periodEnd = Utils.getPeriodEnd(date: Date())
        self.requestData(periodStart: self.periodStart!, periodEnd: self.periodEnd!)
    }
    
    private func requestData(periodStart: String, periodEnd: String) {
        self.addLoadingView()
        TVGuideRequest.shareInstance.getCurrentShowForAllChannels(context: self, channelId: Application.shareInstance.listChannelsId!, periodStart: self.periodStart!, periodEnd: self.periodEnd!) { (success, data) in
            self.removeLoadingView()
            self.tvGuides = data as! [TVGuide]
            self.tvGuideContentView?.setDataSource(dataSource: self.tvGuides as AnyObject)
        }
    }
    
    
    override func sortAction() {
        self.showSortByOption()
    }
    
    private func showSortByOption() {
        SortChannel.showSortByOptionInViewController(controller: self, sortByChannelNameBlock: {
            let results = SortChannel.sortTVGuideByChannelName(array: self.tvGuides)
            self.tvGuideContentView?.setDataSource(dataSource: results as AnyObject)
            FirebaseDataManager.shareInstance.storeSortChannelsBy(sortBy: .name)
        }, sortByChannelNumberBlock: {
            let results = SortChannel.sortTVGuideByChannelNumber(array: self.tvGuides)
            self.tvGuideContentView?.setDataSource(dataSource: results as AnyObject)
            FirebaseDataManager.shareInstance.storeSortChannelsBy(sortBy: .number)
        })
    }
    
}
