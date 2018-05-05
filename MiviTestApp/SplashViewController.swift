//
//  SplashViewController.swift
//  MiviTestApp
//
//  Created by sumo on 06/05/18.
//  Copyright © 2018 sumo. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    var   userAttribute = Attribute()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
        
        perform(#selector(SplashViewController.showmainmenu), with: nil, afterDelay: 5)
 
    }
    
    @objc func showmainmenu(){
        
//        performSegue(withIdentifier: "mainmenu", sender: self)
        
        // go to next screen
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let userDetailViewController = storyboard.instantiateViewController(withIdentifier: "UserDetailViewController") as! UserDetailViewController
        userDetailViewController.userAttribute = userAttribute
        self.navigationController?.pushViewController(userDetailViewController, animated: true) 
        
    }
}
