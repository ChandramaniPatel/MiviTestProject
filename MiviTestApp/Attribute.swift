//
//  Attribute.swift
//  MiviTestApp
//
//  Created by sumo on 05/05/18.
//  Copyright © 2018 sumo. All rights reserved.
//

import Foundation

struct Attribute  {
    
    // from  "type": "services",
    
    var msn: String
    var dataUsageThreshold: Bool
    var credit: Int
    var creditExpiry: String
    
    // "type": "subscriptions",
    
    var includedDataBalance: Int
    var autoRenewal: Bool
    var primarySubscription: Bool
    
   // "type": "products",
    
    var productName : String
    var price: Int
 
    init () {
        self.msn = ""
        self.dataUsageThreshold = false
        self.credit = 0
        self.creditExpiry = ""
        self.includedDataBalance = 0
        self.autoRenewal = false
        self.primarySubscription = false
        self.productName = ""
        self.price = 0

    }
    init(msn: String ,dataUsageThreshold: Bool,credit: Int ,creditExpiry: String,
         includedDataBalance: Int,autoRenewal: Bool,primarySubscription: Bool ,
         productName: String,price: Int
        ) {
        self.msn = msn
        self.dataUsageThreshold = dataUsageThreshold
        self.credit = credit
        self.creditExpiry = creditExpiry

        self.includedDataBalance = includedDataBalance
        self.autoRenewal = autoRenewal
        self.primarySubscription = primarySubscription

        self.productName = productName
        self.price = price
    }
}
