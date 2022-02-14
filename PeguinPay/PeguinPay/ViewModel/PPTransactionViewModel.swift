//
//  PPTransactionViewModel.swift
//  PeguinPay
//
//  Created by Md Shohrab Hossain on 2/13/22.
//

import Foundation

class PPTransactionViewModel {
    
    private let currency = PPCurrency()
    
    func fetchTransactions(completions: ([PPTransaction]?) -> ()) {
        // Note:- This will have a server call to fetch all the transaction based on userId
        completions(PPMockData.shared.allTransaction())
    }
    
    func visiableValues(transaction: PPTransaction) -> (visiableSendAmount: String, visiableReceiveAmount: String) {
        
        let (sendAmt, receiveAmout) = currency.covert(valueInUSD: transaction.sendAmt,
                                                      receiveCountry: transaction.receiveCountry)
        return (formation(sendAmt, PPMockData.shared.senderCountry), formation(receiveAmout, transaction.receiveCountry))
    }
    
    private func formation( _ value: Double, _ country: PPCountry) -> String {
        if PPMockData.shared.senderCountry == .binaria {
            return Int(value).toBinary + " " + country.currency() // TODO: Covert Double to Binary Pending
        }
        return "\(value) \(country.currency())"
    }
}
