//
//  SlideMenuViewController.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class SlideMenuViewController: BaseViewController, GIDSignInUIDelegate {
    @IBOutlet weak var signInButton: GIDSignInButton!
    private(set) var channels = [Channel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        GIDSignIn.sharedInstance().uiDelegate = self
        // Uncomment to automatically sign in the user.
        //GIDSignIn.sharedInstance().signInSilently()
        
        // TODO(developer) Configure the sign-in button look/feel
        
        // Add a custom login button to your app
        let myLoginButton = UIButton(type: .custom)
        myLoginButton.backgroundColor = UIColor.gray
        myLoginButton.frame = CGRect(x: 0, y: 0, width: 180, height: 40);
        myLoginButton.center = view.center;
        myLoginButton.setTitle("Facebook", for: .normal)
        
        // Handle clicks on the button
        myLoginButton.addTarget(self, action: #selector(self.loginButtonClicked), for: .touchUpInside)
        
        // Add the button to the view
        view.addSubview(myLoginButton)
        
    }
    
    // Once the button is clicked, show the login dialog
    @objc func loginButtonClicked() {
        //let loginManager = FBSDKLoginManager()
        /*
        loginManager.logIn([ .PublicProfile ], viewController: self) { loginResult in
            switch loginResult {
            case .Failed(let error):
                print(error)
            case .Cancelled:
                print("User cancelled login.")
            case .Success(let grantedPermissions, let declinedPermissions, let accessToken):
                print("Logged in!")
            }
        }*/
        
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                if fbloginresult.grantedPermissions != nil {
                    if(fbloginresult.grantedPermissions.contains("email"))
                    {
                        fbLoginManager.logOut()
                    }
                }
            }
        }
    }
    
    override func initData() {
        super.initData()
        
        /*
        ChannelsRequest.shareInstance.getListChannel(context: self) { (success, data) in
            if(success) {
            }
        }
        
            
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) { 
            TVGuideRequest.shareInstance.getCurrentShowForAllChannels(context: self, channelId: Application.shareInstance.listChannelsId!, periodStart: Utils.getCurrentTime(), periodEnd: Utils.getPeriodEnd(date: Utils.sevenDaysfromNow()), completion: { (success, data) in
                
            })
        }*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // Implement these methods only if the GIDSignInUIDelegate is not a subclass of
    // UIViewController.
    
    // Stop the UIActivityIndicatorView animation that was started when the user
    // pressed the Sign In button
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
        
    }
    
    // Present a view that prompts the user to sign in with Google
    func sign(_ signIn: GIDSignIn!,
              present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    // Dismiss the "Sign in with Google" view
    func sign(_ signIn: GIDSignIn!,
              dismiss viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func didTapSignOut(sender: AnyObject) {
        GIDSignIn.sharedInstance().signOut()
    }
    
}
