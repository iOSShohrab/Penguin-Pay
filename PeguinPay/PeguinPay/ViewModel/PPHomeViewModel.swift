//
//  PPHomeViewModel.swift
//  PeguinPay
//
//  Created by Md Shohrab Hossain on 2/13/22.
//

import Foundation

class PPHomeViewModel {
    
    func fetchExchange() {
        PPNetwork.shared.dataTask(apiRequest: PPRequest(urlString: PPNetworkURL.exchange)) { (response) in
            if let data = response.data {
                if let json = try? JSONSerialization.jsonObject(with: data, options: [ ]) as? [String : AnyObject] {
                    let exchangeRates = PPExchangeRate(with: json)
                    PPMockData.shared.updateExchangeRate(exchangeRates)
                }
            }
        }
    }
}
