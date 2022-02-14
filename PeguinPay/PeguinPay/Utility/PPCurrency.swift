//
//  PPCurrency.swift
//  PeguinPay
//
//  Created by Md Shohrab Hossain on 2/13/22.
//

import Foundation

class PPCurrency {
    
    func covert(valueInUSD: Double, receiveCountry: PPCountry) -> (sendAmt: Double, receiveAmout: Double) {
        return (valueInUSD, valueInUSD.covertFromUSD(to: receiveCountry))
    }
}

extension Double {
    
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    func USD(from country: PPCountry) -> Double {
        if let rate = PPMockData.shared.exchangeRate?.rates?[country.currency()] as? Double {
            return (self / rate).rounded(toPlaces: 2) // rate = 1 USD to Country
        }
        return 0
    }
    
    /** it will covert from USD to specific country value */
    
    func covertFromUSD(to country: PPCountry) -> Double {
        if let rate = PPMockData.shared.exchangeRate?.rates?[country.currency()] as? Double {
            return (self * rate).rounded(toPlaces: 2) // rate = 1 USD to Country
        }
        return 0
    }
}
