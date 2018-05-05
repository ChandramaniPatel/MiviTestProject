//
//  UserDetailViewController.swift
//  MiviTestApp
//
//  Created by sumo on 05/05/18.
//  Copyright © 2018 sumo. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    var   userAttribute = Attribute()
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var msnLabel: UILabel!
    @IBOutlet weak var creditLabel: UILabel!
    @IBOutlet weak var creditExpiryLabel: UILabel!
    @IBOutlet weak var includedDataBalanceLabel: UILabel!
    @IBOutlet weak var autoRenewbleLabel: UILabel!
    @IBOutlet weak var primarySubcriptionLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setupUI()  {
        productNameLabel.text = "Product Name : \(String(describing: userAttribute.productName))"
        msnLabel.text = "MSN : \(String(describing: userAttribute.msn))"
        creditExpiryLabel.text = "Credit : \(String(describing: userAttribute.creditExpiry))"
        creditLabel.text = "Credit Expiry : \(String(describing: userAttribute.credit))"
        includedDataBalanceLabel.text = "Data Balance : \(String(describing: userAttribute.includedDataBalance))"
        autoRenewbleLabel.text = "Auto Renewal : \(String(describing: userAttribute.autoRenewal))"
        primarySubcriptionLabel.text = "Subcription : \(String(describing: userAttribute.primarySubscription))"
        productPriceLabel.text = "Prduct Price : \(String(describing: userAttribute.price))"
    }
    
}













