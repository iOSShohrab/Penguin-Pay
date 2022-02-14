//
//  PPExtensions.swift
//  PeguinPay
//
//  Created by Md Shohrab Hossain on 2/13/22.
//

import Foundation

extension Date {
    var stringValue: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, YYYY"
        return dateFormatter.string(from: self)
    }
}

extension Int {
    var toBinary: String {
        return String(self, radix: 2)
    }
    
    var toString: String {
        return "\(self)"
    }
}

extension String {
    var Decimal: String {
        if let number = Int(self, radix: 2) {
            return "\(number)"
        }
        return ""
    }
}
