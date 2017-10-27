//
//  AppDelegate.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit
import FBSDKCoreKit

let kClientID = "157844766034-udj6jqhk31k88v9f3un004ocohogsqgf.apps.googleusercontent.com"


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //PFFacebookUtils.initializeFacebook(applicationLaunchOptions: launchOptions)
       // FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        
        self.setupRootViewController()
        
        // Initialize sign-in
        self.configGoogleSignInSDK()
        
        
        return true
    }
    
    /*
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    // Optional: Place the button in the center of your view.
    loginButton.center = self.view.center;
    [self.view addSubview:loginButton];
     
     if ([FBSDKAccessToken currentAccessToken]) {
     // User is logged in, do work such as go to next view controller.
     }
     
    */
    
    
    /*
    //  AppDelegate.m
    #import <FBSDKCoreKit/FBSDKCoreKit.h>
    
    - (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[FBSDKApplicationDelegate sharedInstance] application:application
    didFinishLaunchingWithOptions:launchOptions];
    // Add any custom logic here.
    return YES;
    }
    
    - (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
    sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
    BOOL handled = [[FBSDKApplicationDelegate sharedInstance] application:application
    openURL:url
    sourceApplication:sourceApplication
    annotation:annotation
    ];
    // Add any custom logic here.
    return handled;
    } 
    */
    

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
    
    /*
    func application(_ application: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any])
        -> Bool {
            return GIDSignIn.sharedInstance().handle(url,
                                                        sourceApplication:options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
                                                        annotation: [:])
    }
    */
    
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
    //MARK: - Google Sigin Delegate
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error == nil) {
            
        } else {
            print("\(error.localizedDescription)")
        }
    }
    
    

    public func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        
    }
    
    private func configGoogleSignInSDK() {
        GIDSignIn.sharedInstance().clientID = kClientID
        GIDSignIn.sharedInstance().delegate = self
    }
    
    private func configFacebookSDK() {
        
    }


    private func setupRootViewController() {
       // self.window = UIWindow(frame: UIScreen.main.bounds)
       // let slideMenuViewController = SlideMenuViewController()
       // self.window?.rootViewController = slideMenuViewController
        //self.window?.makeKeyAndVisible()
    }
}

