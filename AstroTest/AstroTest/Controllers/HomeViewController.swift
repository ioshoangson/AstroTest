//
//  HomeViewController.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class HomeContentView: BaseCollectionView {
    @IBOutlet private(set) var contentCollectionView: UICollectionView?
    
    let ITEM_SIZE = CGSize(width: Constants.SCREEN_WIDTH/2 - 26, height: Constants.SCREEN_WIDTH/2 - 26)
    let CELL_IDENTIFIER = "FavoriesCollectionViewCellIdentifier"
    let CELL_NAME = "FavoriesCollectionViewCell"

    override func setupCollectionView() {
        self.registerNibCell(nibName: CELL_NAME, cellIdentifier: CELL_IDENTIFIER, collectionView: self.contentCollectionView!)
    }
    
    override func setDataSource(dataSource: AnyObject) {
        self.configCollectionView = ConfigCollectionView(dataSources: dataSource as! [AnyObject], collectionViewFlowLayout: self.configCollectionViewLayoutForDevice()!)
        self.reloadCollectionView()
    }
    
    override func configCollectionViewLayoutForDevice() -> ConfigCollectionViewFlowLayout? {
        let contentConfigCollectionViewLayout = ConfigCollectionViewFlowLayout(minimumLineSpacingForSection: 15, minimumInteritemSpacingForSection: 15, insetForSection: UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15))
        contentConfigCollectionViewLayout.itemSize = self.sizeForItems()
        return contentConfigCollectionViewLayout
    }
    
    override func sizeForItems() -> CGSize {
        return ITEM_SIZE
    }
}

class HomeViewController: BaseViewController {
    
    @IBOutlet weak private var homeContentView: HomeContentView?
    private var favorites = [Channel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func initData() {
        let favorites = LocalDataManager.shareInstance.getListFavoritesChannel() as? Array<Channel>
        if favorites != nil && (favorites?.count)! > 0 {
            self.favorites = favorites!
            self.homeContentView?.setDataSource(dataSource: self.favorites as AnyObject)
        }
    }
    
    override func setupUI() {
        super.setupUI()
        self.title = NSLocalizedString("HOME", comment: "")
        self.addSortButton()
    }

    override func sortAction() {
        self.showSortByOption()
    }

    private func showSortByOption() {
        SortChannel.showSortByOptionInViewController(controller: self, sortByChannelNameBlock: {
            let results = SortChannel.sortByChannelName(array: self.favorites)
            self.homeContentView?.setDataSource(dataSource: results as AnyObject)
            FirebaseDatamanager.shareInstance.storeSortChannelsBy(sortBy: .name)
        }, sortByChannelNumberBlock: {
            let results = SortChannel.sortByChannelNumber(array: self.favorites)
            self.homeContentView?.setDataSource(dataSource: results as AnyObject)
            FirebaseDatamanager.shareInstance.storeSortChannelsBy(sortBy: .number)
        })
    }
}
