//
//  loginScreenVC.swift
//  trell
//
//  Created by Rohit Mishra on 7/25/16.
//  Copyright © 2016 Rohit Mishra. All rights reserved.
//

import UIKit

class loginScreenVC: UIViewController,FBSDKLoginButtonDelegate {
    
    let loginButton: FBSDKLoginButton = {
        let button = FBSDKLoginButton()
        button.readPermissions = ["email"]
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loginButton)
        
      /*  if (FBSDKAccessToken.currentAccessToken() != nil)
        {
            // User is already logged in, do work such as go to next view controller.
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let vc:UITabBarController = storyBoard.instantiateViewControllerWithIdentifier("tab") as! UITabBarController
            self.presentViewController(vc, animated:true, completion:nil)
        }*/
        loginButton.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        
       // navigateHomePage()
    }
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        
    }
   
 
  
  /*  func navigateHomePage()
    {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let vc:UITabBarController = storyBoard.instantiateViewControllerWithIdentifier("tab") as! UITabBarController
        self.presentViewController(vc, animated:true, completion:nil)
       

    }*/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

