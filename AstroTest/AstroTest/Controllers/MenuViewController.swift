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
            self.showLogoutAlert()
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
    
    private func showLogoutAlert() {
        let alertVC = UIAlertController(title: nil, message: "Would you like to logout?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "No", style: .cancel) { action -> Void in
        }
        alertVC.addAction(cancelAction)
        
        let okAction = UIAlertAction(title: "Yes", style: .default) { action -> Void in
            DispatchQueue.main.async {
                self.logout()
            }
        }
        alertVC.addAction(okAction)
        self.present(alertVC, animated: true, completion: nil)
    }
    
    private func logout() {
        UserRequest.shareInstance.logout(completion: { (success) in
            APP_DELEGATE.setupLoginViewController()
        })
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
            self.initWithViewController(controller: TVGuideViewController())
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
}
