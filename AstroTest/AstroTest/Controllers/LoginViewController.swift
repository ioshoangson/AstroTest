//
//  LoginViewController.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

enum LoginTypes {
    case facebook
    case google
}

protocol LoginDelegate: class {
    func loginSuccess(loginViewController: BaseViewController, loginType: LoginTypes)
}

class LoginViewController: BaseViewController {
    @IBOutlet weak var googleButton: GIDSignInButton!
    @IBOutlet weak var facbookButton: UIButton?
    
    public weak var delegate: LoginDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        GIDSignIn.sharedInstance().uiDelegate = self
        
        self.registerNotification()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: Constants.GOOGLE_LOGIN_NOTIFICATION), object: nil)
    }
    
    private func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleNotification), name: NSNotification.Name(rawValue: Constants.GOOGLE_LOGIN_NOTIFICATION), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonClicked(sender: AnyObject) {
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if (error == nil){
                if (self.delegate != nil) {
                    self.delegate?.loginSuccess(loginViewController: self, loginType: .facebook)
                }
                
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                if fbloginresult.grantedPermissions != nil {
                    if(fbloginresult.grantedPermissions.contains("email"))
                    {
                       // fbLoginManager.logOut()
                    }
                }
            }
        }
    }
    
    
    @objc private func handleNotification() {
        if (self.delegate != nil) {
            self.delegate?.loginSuccess(loginViewController: self, loginType: .google)
        }
    }
}


extension LoginViewController: GIDSignInUIDelegate {
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
        
    }
    
    func sign(_ signIn: GIDSignIn!,
              present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!,
              dismiss viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
}
