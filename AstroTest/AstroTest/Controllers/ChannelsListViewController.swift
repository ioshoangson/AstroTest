//
//  ChannelsListViewController.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class ChannelsListContentView: BaseTableView {
    let HEIGHT_CELL: CGFloat = 44
    
    @IBOutlet private(set) var contentTableView: UITableView?
    private var contentConfigTableViewLayout: ConfigTableViewLayout?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setupTableView() {
        self.registerNibCell(nibName: String(describing: ChannelTableViewCell.self), cellIdentifier: String(describing: ChannelTableViewCell.self), tableView: self.contentTableView!)
        self.contentConfigTableViewLayout = ConfigTableViewLayout(heightCell: HEIGHT_CELL, tableViewStyle: .plain)
    }
    
    override func setDataSource(dataSource: AnyObject) {
        self.configTableView = ConfigTableView(dataSources: dataSource as! [AnyObject], configTableViewLayout: self.contentConfigTableViewLayout!)
        self.reloadTableView()
    }
}

class ChannelsListViewController: BaseViewController {
    
    let LOGIN_STORYBOAD_ID = "loginStoryboardId"

    @IBOutlet weak private(set) var channelsListContentView: ChannelsListContentView?
    
    public var favories = [Channel]()
    private var channels = [Channel]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.channelsListContentView?.context = self
    }

    override func setupUI() {
        super.setupUI()
        self.title = "CHANNELS"
        
        self.addSortButton()
    }
    
    
    //MARK:
    //MARK: - Request Data
    
    override func initData() {
        self.addLoadingView()
        ChannelsRequest.shareInstance.getListChannel(context: self) { (success, data) in
            self.removeLoadingView()
            if(success) {
                self.channels = data as! [Channel]
                self.channelsListContentView?.setDataSource(dataSource: self.channels as AnyObject)
            }
        }
        
        FirebaseDataManager.shareInstance.getListFavoritesChannel { (data) in
            print("FIREBASE DATABASE CLOUD: \(data)")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK:
    //MARK: - Sort
    override func sortAction() {
        self.showSortByOption()
    }
    
    private func showSortByOption() {
        SortChannel.showSortByOptionInViewController(controller: self, sortByChannelNameBlock: {
            let results = SortChannel.sortByChannelName(array: self.channels)
            self.channelsListContentView?.setDataSource(dataSource: results as AnyObject)
            FirebaseDataManager.shareInstance.storeSortChannelsBy(sortBy: .name)
        }, sortByChannelNumberBlock: {
            let results = SortChannel.sortByChannelNumber(array: self.channels)
            self.channelsListContentView?.setDataSource(dataSource: results as AnyObject)
            FirebaseDataManager.shareInstance.storeSortChannelsBy(sortBy: .number)
        }, sortByChannelNumberAndFavoritesBlock: {
            let results = SortChannel.sortByFavoriteAndChannelNumber(array: self.channels)
            self.channelsListContentView?.setDataSource(dataSource: results as AnyObject)
            FirebaseDataManager.shareInstance.storeSortChannelsBy(sortBy: .nameAndFavorites)
        }, sortByChannelNameAndFavoritesBlock: {
            let results = SortChannel.sortByFavoriteAndChannelName(array: self.channels)
            self.channelsListContentView?.setDataSource(dataSource: results as AnyObject)
            FirebaseDataManager.shareInstance.storeSortChannelsBy(sortBy: .numberAndFavorites)
        })
    }
    
    
    
    //MARK:
    //MARK: - Public Methods
    
    public func getFavorites() -> [Channel]{
        let favories = LocalDataManager.shareInstance.getListFavoritesChannel() as? Array<Channel>
        if favories != nil && (favories?.count)! > 0 {
            return favories!
        }
        return [Channel]()
    }
    
    public func showLoginViewController() {
        let loginViewController = LoginViewController(showBackButton: true)
        loginViewController.delegate = self
        self.present(loginViewController, animated: true, completion: nil)
    }
    
    public func showLoginAlert() {
        let alertVC = UIAlertController(title: nil, message: "Please login to use this feature!", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
        }
        alertVC.addAction(cancelAction)

        let okAction = UIAlertAction(title: "OK", style: .default) { action -> Void in
            DispatchQueue.main.async {
                self.showLoginViewController()
            }
        }
        alertVC.addAction(okAction)
        self.present(alertVC, animated: true, completion: nil)
    }
    
}

extension ChannelsListViewController: ChannelTableViewCellDelegate {
    func favoritesAction(channel: Channel, channelTableViewCell: BaseTableViewCell) {
        if Application.shareInstance.isLogin() {
            channel.setFavorite(isFavorites: !channel.isFavorites)
            channelTableViewCell.updateData(data: channel)
            
            if  channel.isFavorites {
                self.favories = self.getFavorites()
                self.favories.append(channel)
                LocalDataManager.shareInstance.storeFavoritesChannels(channels: self.favories as AnyObject)
                FirebaseDataManager.shareInstance.storeFavoritesChannels(channels: channel)
            }else {
                LocalDataManager.shareInstance.removeChannel(channel: channel)
            }
        }else {
           self.showLoginAlert()
        }
    }
}


extension ChannelsListViewController: LoginDelegate {
    func closeAction(loginViewController: BaseViewController, loginType: LoginTypes) {
        
    }

    func loginSuccess(loginViewController: BaseViewController, loginType: LoginTypes) {
        self.dismiss(animated: true, completion: {})
    }
}
