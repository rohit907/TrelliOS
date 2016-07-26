//
//  SecondViewController.swift
//  trell
//
//  Created by Rohit Mishra on 7/23/16.
//  Copyright © 2016 Rohit Mishra. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn1 = UIButton()
        btn1.setImage(UIImage(named:"Search.png"), forState: .Normal)
        btn1.frame = CGRectMake(0, 0, 30, 30)
        btn1.addTarget(self, action: Selector("action1:"), forControlEvents: .TouchUpInside)
        let item1 = UIBarButtonItem()
        item1.customView = btn1
        
        let btn2 = UIButton()
        btn2.setImage(UIImage(named: "notification.png"), forState: .Normal)
        btn2.frame = CGRectMake(0, 0, 30, 30)
        btn2.addTarget(self, action: Selector("action2:"), forControlEvents: .TouchUpInside)
        let item2 = UIBarButtonItem()
        item2.customView = btn2
        
        let btn3 = UIButton()
        btn3.setImage(UIImage(named:"profile.png"), forState: .Normal)
        btn3.frame = CGRectMake(0, 0, 30, 30)
        btn3.addTarget(self, action:#selector(SecondViewController.profile(_:)), forControlEvents: .TouchUpInside)
        let item3 = UIBarButtonItem()
        item3.customView = btn3
        
        
        self.navigationItem.rightBarButtonItems = [item3,item2,item1]
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
func profile(_: (UIBarButtonItem))
{
    
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    
    let vc:UINavigationController = storyBoard.instantiateViewControllerWithIdentifier("profileVC") as! UINavigationController
    self.presentViewController(vc, animated:true, completion:nil)
    
    }

}

