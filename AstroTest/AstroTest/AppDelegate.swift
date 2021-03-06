//
//  AppDelegate.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import Firebase

let kClientID = "157844766034-udj6jqhk31k88v9f3un004ocohogsqgf.apps.googleusercontent.com"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()

        self.configGoogleSignInSDK()
        
        self.getListChannelFromBackground()
        
        self.setupRootViewController()

        
        return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any]) -> Bool {
        let sourceApplication =  options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String
        let annotation = options[UIApplicationOpenURLOptionsKey.annotation]
        
        let googleHandler = GIDSignIn.sharedInstance().handle(
            url,
            sourceApplication: sourceApplication,
            annotation: annotation )
        
        let facebookHandler = FBSDKApplicationDelegate.sharedInstance().application (
            app,
            open: url,
            sourceApplication: sourceApplication,
            annotation: annotation)
        
        return googleHandler || facebookHandler
    }
    
    
    
    //MARK:
    //MARK: - Private Methods
    private func configGoogleSignInSDK() {
        GIDSignIn.sharedInstance().clientID = kClientID
        GIDSignIn.sharedInstance().delegate = self
    }
    
    private func configFacebookSDK() {
        
    }


    public func setupRootViewController() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let homeNavigationController = UINavigationController(rootViewController: HomeViewController())
        let slideMenuViewController = SlideMenuViewController(menuViewController: MenuViewController(), centerViewController: homeNavigationController)
        self.window?.rootViewController = slideMenuViewController
        self.window?.makeKeyAndVisible()
    }
    
    public func setupLoginViewController() {
        let loginViewController = LoginViewController(showBackButton: false)
        self.window?.rootViewController = loginViewController
    }
    
    private func getListChannelFromBackground() {
        DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
            ChannelsRequest.shareInstance.getListChannel(context: nil, completion: { (success, data) in
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.FINISH_LOAD_CHANNEL_LIST_NOTIFICATION), object: nil)
            })
        }
    }
}


extension AppDelegate: GIDSignInDelegate {
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error == nil) {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.GOOGLE_LOGIN_NOTIFICATION), object: nil)
        } else {
            print("\(error.localizedDescription)")
        }
    }
    
    
    public func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        
    }
}
