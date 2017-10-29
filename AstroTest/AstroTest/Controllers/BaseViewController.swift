//
//  BaseViewController.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.initData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:
    //MARK: - Public Methods
    
    public func getSlideViewController() -> SlideMenuViewController? {
        let slideViewController = self.slideMenuViewController()
        if slideViewController != nil{
            return slideViewController as? SlideMenuViewController
        }
        return nil
    }

    public func setupUI() {
        if (self.isFirstViewControllerInNavigationViewController()) {
            self.addMenuButton()
        }else {
            self.addBackButton()
        }
    }
    
    public func initData() {
        
    }
    
    public func showMenu() {
        self.getSlideViewController()?.toogleMenu()
    }
    
    public func sortAction() {
    }

    public func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    public func addMenuButton() {
        let menuButton = self.createBarButtonItem(imageName: "ic_menu_black_24dp", selector: #selector(self.showMenu))
        self.navigationItem.leftBarButtonItem = menuButton
    }
    
    public func addBackButton() {
        let backButton = self.createBarButtonItem(imageName: "back_blackcolor_nav", selector: #selector(self.backAction))
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    
    public func addSortButton() {
        let menuButton = self.createBarButtonItem(imageName: "filter_icon", selector: #selector(self.sortAction))
        self.navigationItem.rightBarButtonItem = menuButton
    }
    
    public func addLoadingView(){
        let loadingView: UIView = (Bundle.main.loadNibNamed("LoadingView", owner: self, options: nil)?.first as? LoadingView)!
        loadingView.center = self.view.center
        loadingView.alpha = 0
        self.view.addSubview(loadingView)
        
        UIView.animate(withDuration: 0.3) {
            loadingView.alpha = 0.7
        }
    }
    
    public func removeLoadingView(){
        let subViews = self.view.subviews
        for subView in subViews {
            if subView is LoadingView {
                UIView.animate(withDuration: 0.3, animations: {
                    subView.alpha = 0
                }, completion: { (success) in
                    subView.removeFromSuperview()
                })
            }
        }
    }
    
    //MARK:
    //MARK: - Private Methods
    
    private func isFirstViewControllerInNavigationViewController() -> Bool {
        return (self.navigationController != nil) && (self.navigationController?.viewControllers.count == 1)
    }
    
    private func createBarButtonItem(imageName: String, selector: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        button.addTarget(self, action: selector, for: .touchUpInside)
        let customView = UIView(frame: button.bounds)
        customView.backgroundColor = UIColor.clear
        customView.addSubview(button)
        let leftButton: UIBarButtonItem = UIBarButtonItem(customView: customView)
        return leftButton
    }
}
