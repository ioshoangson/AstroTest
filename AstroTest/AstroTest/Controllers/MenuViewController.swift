//
//  MenuViewController.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class MenuContentView: BaseTableView {
    let HEIGHT_CELL: CGFloat = 44
    
    @IBOutlet private(set) var contentTableView: UITableView?
    private var contentConfigTableViewLayout: ConfigTableViewLayout?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setupTableView() {
        self.registerNibCell(nibName: String(describing: MenuTableViewCell.self), cellIdentifier: String(describing: MenuTableViewCell.self), tableView: self.contentTableView!)
        self.contentConfigTableViewLayout = ConfigTableViewLayout(heightCell: HEIGHT_CELL, tableViewStyle: .plain)
        self.contentTableView?.alwaysBounceVertical = false
        self.contentTableView?.tableFooterView = UIView(frame: .zero)
    }
    
    override func setDataSource(dataSource: AnyObject) {
        self.configTableView = ConfigTableView(dataSources: dataSource as! [AnyObject], configTableViewLayout: self.contentConfigTableViewLayout!)
        self.reloadTableView()
    }
}


class MenuViewController: BaseViewController {
    @IBOutlet weak private(set) var menuContentView: MenuContentView?
    @IBOutlet weak private(set) var menuHeader: MenuHeader?
    @IBOutlet weak private(set) var menuFooter: MenuFooterView?

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
        
        self.menuHeader?.editProfileAction = {
            
        }
        
        self.menuFooter?.logoutAction = {
            UserRequest.shareInstance.logout(completion: { (success) in
                APP_DELEGATE.setupLoginViewController()
            })
        }
        
        self.menuContentView?.didSelectItemAtIndex = {
            (item: AnyObject, atIndex: IndexPath) -> Void in
            let menu: Menu = item as! Menu
            DispatchQueue.main.async {
                self.pushToViewController(menuType: menu.menuType!)
            }
        }
    }
    
    override func initData() {
        super.initData()
        
        self.menuContentView?.setDataSource(dataSource: [Menu(titleMenu: "Home", menuType: .home),
                                                         Menu(titleMenu: "Channel", menuType: .channel),
                                                         Menu(titleMenu: "TV Guide", menuType: .tvGuide),
                                                         Menu(titleMenu: "Setting", menuType: .settting)] as AnyObject)
    }
    
    
    private func pushToViewController(menuType: MenuTypes) {
        switch menuType {
        case .home:
            self.initWithViewController(controller: HomeViewController())
            break
        case .channel:
            self.initWithViewController(controller: ChannelsListViewController())
            break
        case .tvGuide:
            break
        case .settting:
            break
        }
    }
    
    
    private func initWithViewController(controller: UIViewController) {
        self.getSlideViewController()?.toogleMenu()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            let nav = UINavigationController(rootViewController: controller)
            self.getSlideViewController()?.setCenterViewController(controller: nav)
        }
    }

    @IBAction func demoAction(sender: AnyObject) {
        self.getSlideViewController()?.toogleMenu()

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) { 
            let channelsListViewController = ChannelsListViewController()
            let nav = UINavigationController(rootViewController: channelsListViewController)
            self.getSlideViewController()?.setCenterViewController(controller: nav)
        }
    }

}
