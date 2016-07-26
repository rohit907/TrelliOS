//
//  ProfileVC.swift
//  trell
//
//  Created by Rohit Mishra on 7/25/16.
//  Copyright © 2016 Rohit Mishra. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    let userImage = UIImageView(frame: CGRectMake(0 ,0, 100, 100))
    let userIdName = UILabel(frame: CGRectMake(0 ,0, 150, 21))
    let userName = UILabel(frame: CGRectMake(0 ,0, 300, 50))
    let noOfTales = UILabel(frame: CGRectMake(0 ,0, 10, 10))
    let Tales = UILabel(frame: CGRectMake(0 ,0, 10, 10))
    let noOfFollowers = UILabel(frame: CGRectMake(0 ,0, 10 , 10))
    let Followers = UILabel(frame: CGRectMake(0 ,0, 10 , 10))
    let noOfFollowing = UILabel(frame: CGRectMake(0 ,0, 10 , 10))
    let Following = UILabel(frame: CGRectMake(0 ,0, 10 , 10))
    
    
    let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .ScaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        return imageView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
         setup()
    
        self.view.addSubview(userImage)
        let btn1 = UIButton()
        btn1.setImage(UIImage(named:"logout.png"), forState: .Normal)
        btn1.frame = CGRectMake(0, 0, 30, 30)
        btn1.addTarget(self, action: Selector("action1:"), forControlEvents: .TouchUpInside)
        let item1 = UIBarButtonItem()
        item1.customView = btn1
        self.navigationItem.rightBarButtonItems = [item1]
        fetchProfile()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */



    


    func setup(){
        
        //userImage
        userImage.center=CGPointMake(60 , 120)
        userImage.layer.masksToBounds = false
        userImage.layer.borderColor = UIColor.whiteColor().CGColor
        userImage.layer.cornerRadius = 13
        userImage.layer.cornerRadius = userImage.frame.size.height/2
        userImage.clipsToBounds = true
        self.view.addSubview(userImage)
        
        //userIdName
        userIdName.center=CGPointMake(190 , 90)
        userIdName.textAlignment = NSTextAlignment.Left
        userIdName.text = "@rohitmishra"
        userIdName.sizeToFit()
        self.view.addSubview(userIdName)
        
        
        //userName
        userName.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        userName.center=CGPointMake(270, 120)
        userName.textAlignment=NSTextAlignment.Left
        userName.text="xyz Mishra"
        self.view.addSubview(userName)
        
        //countTales
        noOfTales.center=CGPointMake(110,150)
        noOfTales.textAlignment=NSTextAlignment.Left
        noOfTales.text="5"
        noOfTales.sizeToFit()
        self.view.addSubview(noOfTales)
        
        //countFollowers
        noOfFollowers.center=CGPointMake(160, 150)
        noOfFollowers.textAlignment=NSTextAlignment.Left
        noOfFollowers.text="23"
        noOfFollowers.sizeToFit()
        self.view.addSubview(noOfFollowers)
        
        //countFollowing
        noOfFollowing.center=CGPointMake(240, 150)
        noOfFollowing.textAlignment=NSTextAlignment.Left
        noOfFollowing.text="32"
        noOfFollowing.sizeToFit()
        self.view.addSubview(noOfFollowing)
        
        Tales.center=CGPointMake(110, 170)
        Tales.textAlignment=NSTextAlignment.Left
        Tales.text="Tales"
        Tales.sizeToFit()
        self.view.addSubview(Tales)
        
        
        Followers.center=CGPointMake(160, 170)
        Followers.textAlignment=NSTextAlignment.Left
        Followers.text="Followers"
        Followers.sizeToFit()
        self.view.addSubview(Followers)
        
        
        Following.center=CGPointMake(240, 170)
        Following.textAlignment=NSTextAlignment.Left
        Following.text="Following"
        Following.sizeToFit()
        self.view.addSubview(Following)
        
        
    }
    
    func fetchProfile() {
        let parameters = ["fields": "email, first_name, last_name, picture.type(large)"]
        FBSDKGraphRequest(graphPath: "me", parameters: parameters).startWithCompletionHandler({ (connection, user, requestError) -> Void in
            
            if requestError != nil {
                print(requestError)
                return
            }
            
            var _ = user["email"] as? String
            let firstName = user["first_name"] as? String
            let lastName = user["last_name"] as? String
            
            self.userName.text = "\(firstName!) \(lastName!)"
            
            var pictureUrl = ""
            
            if let picture = user["picture"] as? NSDictionary, data = picture["data"] as? NSDictionary, url = data["url"] as? String {
                pictureUrl = url
            }
            
            let url = NSURL(string: pictureUrl)
            NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
                if error != nil {
                    print(error)
                    return
                }
                
                let image = UIImage(data: data!)
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.userImage.image = image
                })
                
            }).resume()
            
        })
    }

    
    

    
}