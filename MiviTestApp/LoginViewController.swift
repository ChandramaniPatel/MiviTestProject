//
//  LoginViewController.swift
//  MiviTestApp
//
//  Created by sumo on 05/05/18.
//  Copyright © 2018 sumo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    
    var   userAttribute = Attribute()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = true

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
       func showAlert()->(Void) {
        let alertController = UIAlertController(title: "Alert!", message: "User name or password incorrect.Please try again!", preferredStyle: UIAlertControllerStyle.alert)
        
        let cancelAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel) { (action) -> Void in
            
        }
        alertController.addAction(cancelAction)
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    func parseInfo(included : [[String:Any]]) {
        
        //userAttribute = Attribute()

        for j in 0 ..< included.count {
            
            let resultDict = included[j] as NSDictionary
            //
            var  type = ""
            if let strVal = resultDict["type"] as? String {
                type = strVal
            }
            
            if type == "services" {
                
                var attributes = NSDictionary()
                
                if let attr = resultDict["attributes"] as? NSDictionary {
                    attributes = attr
                }
                
                if let strVal = attributes["msn"] as? String {
                    userAttribute.msn = strVal
                }
                if let strVal = attributes["credit"] as? Int {
                    userAttribute.credit = strVal
                }
                
                if let strVal = attributes["credit-expiry"] as? String {
                    userAttribute.creditExpiry = strVal
                }
                
                if let strVal = attributes["data-usage-threshold"] as? Bool {
                    userAttribute.dataUsageThreshold = strVal
                }
                
                continue
            }
            //
            
            if type == "subscriptions" {
                
                var attributes = NSDictionary()
                
                if let attr = resultDict["attributes"] as? NSDictionary {
                    attributes = attr
                }
                
                if let strVal = attributes["included-data-balance"] as? Int {
                    userAttribute.includedDataBalance = strVal
                }
                
                if let strVal = attributes["auto-renewal"] as? Bool {
                    userAttribute.autoRenewal = strVal
                }
                
                if let strVal = attributes["primary-subscription"] as? Bool {
                    userAttribute.primarySubscription = strVal
                }
                continue
            }
            
            if type == "products" {
                
                var attributes = NSDictionary()
                
                if let attr = resultDict["attributes"] as? NSDictionary {
                    attributes = attr
                }
                
                if let strVal = attributes["price"] as? Int {
                    userAttribute.price = strVal
                }
                if let strVal = attributes["name"] as? String {
                    userAttribute.productName = strVal
                }
            }
            continue
        }

    }
    
    @IBAction func SignInAction(_ sender: Any) {
        
        guard !(userNameTextField.text?.isEmpty)!,!((passwordTextfield.text?.isEmpty)!) else {
            showAlert()
            return
        }
        
        let url = Bundle.main.url(forResource: "collection", withExtension: "json")!
        do {
            let jsonData = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: jsonData) as! [String:Any]
            print(json)
            
            let included = json["included"] as! [[String:Any]]
            print("included : \(included)")
            
            parseInfo(included: included)
            print("userAttribute : \(String(describing: userAttribute))")
            
            if userAttribute.msn == "0468874507" {
                // go to next screen
                 let storyboard = UIStoryboard(name: "Main", bundle: nil)
                 let userDetailViewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
                 userDetailViewController.userAttribute = userAttribute
                 self.navigationController?.pushViewController(userDetailViewController, animated: true) 
            }else {
                showAlert()
            }
        }
        catch {
            print(error)
        }
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
