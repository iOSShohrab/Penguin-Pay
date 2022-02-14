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

struct PPCurrencies {
    
    // 1 USD = * KES
    var KES: Double = 0.0
    var NGN: Double = 0.0
    var TZS: Double = 0.0
    var UGX: Double = 0.0
    
    init(with data: [String: AnyObject]) {
        if let KES = data["KES"] as? Double {
            self.KES = KES
        }
        if let NGN = data["NGN"] as? Double {
            self.NGN = NGN
        }
        if let TZS = data["TZS"] as? Double {
            self.TZS = TZS
        }
        if let UGX = data["UGX"] as? Double {
            self.UGX = UGX
        }
    }
}
