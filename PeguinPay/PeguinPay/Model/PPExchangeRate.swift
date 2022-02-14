//
//  PPExchangeRate.swift
//  PeguinPay
//
//  Created by Md Shohrab Hossain on 2/13/22.
//

import Foundation

struct PPExchangeRate {
    
    var rates: [String: AnyObject]?
    
    init(with data: [String: AnyObject]) {
        if let rates = data["rates"] as? [String: AnyObject] {
            self.rates = rates
        }
    }
}
