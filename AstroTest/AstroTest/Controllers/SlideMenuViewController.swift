//
//  SlideMenuViewController.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

let MARGIN_RIGHT: CGFloat = 100

class SlideMenuViewController: BaseViewController {
    
    let ANIMATION_DURATION = 0.3
    
    private(set) var channels = [Channel]()
    
    
    private var tapGesture: UITapGestureRecognizer?
    
    private var menuViewController: UIViewController?
    private var centerViewController: UIViewController?
    
    @IBOutlet weak private var containerView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    convenience init(menuViewController: UIViewController, centerViewController: UIViewController) {
        self.init()
        self.menuViewController = menuViewController
        self.centerViewController = centerViewController
    }
    
    override func setupUI() {
        super.setupUI()
        
        self.addMenuViewController()
        self.addCenterViewController(controller: self.centerViewController!)
    }
    
    private func addMenuViewController() {
        self.addChildViewController(self.menuViewController!)
        let menuViewFrame  = self.containerView?.frame
        self.menuViewController?.view.frame = menuViewFrame!
        self.containerView?.addSubview((self.menuViewController?.view)!)
        self.menuViewController?.didMove(toParentViewController: self)
    }

    private func addCenterViewController(controller: UIViewController) {
        self.centerViewController = controller
        self.addChildViewController(controller)
        let centerViewFrame  = self.containerView?.frame
        controller.view.frame = centerViewFrame!
        self.containerView?.addSubview((self.centerViewController?.view)!)
        controller.didMove(toParentViewController: self)
    }
    
    
    override func showMenu() {
        self.animationMenuView(isShow: self.isShowAnimation())
    }
    
    private func animationMenuView(isShow: Bool) {
        if isShow {
            UIView.animate(withDuration: ANIMATION_DURATION) {
                self.centerViewController?.view.frame  = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: Constants.SCREEN_WIDTH, height: Constants.SCREEN_HEIGHT))
            }
            self.removeTapGesture()
        }else {
            UIView.animate(withDuration: ANIMATION_DURATION) {
                self.centerViewController?.view.frame  = CGRect(origin: CGPoint(x: Constants.SCREEN_WIDTH - MARGIN_RIGHT, y: 0), size: CGSize(width: Constants.SCREEN_WIDTH, height: Constants.SCREEN_HEIGHT))
            }
            self.addTapGesture()
        }
 
    }
    
    private func addTapGesture() {
        if self.tapGesture == nil {
            self.tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.showMenu))
            self.centerViewController?.view.addGestureRecognizer(self.tapGesture!)
        }
    }
    
    private func removeTapGesture() {
        if self.tapGesture != nil {
            self.centerViewController?.view.removeGestureRecognizer(self.tapGesture!)
            self.tapGesture = nil
        }
    }
    
    
    private func isShowAnimation() -> Bool {
        return Int((self.centerViewController?.view.frame.origin.x)!) != 0
    }
    
    public func setCenterViewController(controller: UIViewController) {
        self.removeViewControllerFromParent(controller: self.centerViewController!)
        self.addCenterViewController(controller: controller)
    }
    
    private func removeViewControllerFromParent(controller: UIViewController) {
        controller.willMove(toParentViewController: nil)
        controller.view.removeFromSuperview()
        controller.removeFromParentViewController()
    }
    
    override func initData() {
        super.initData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func toogleMenu(){
        self.showMenu()
    }
}

