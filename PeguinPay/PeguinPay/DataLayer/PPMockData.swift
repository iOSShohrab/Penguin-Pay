//
//  PPMockData.swift
//  PeguinPay
//
//  Created by Md Shohrab Hossain on 2/13/22.
//

import Foundation

class PPMockData {
    
    static let shared = PPMockData()
    private(set) var senderCountry: PPCountry = .usa
    
    private init() {
        // stop public initialization
    }
    
    func updateCountry(country: PPCountry) {
        self.senderCountry = country
        transactions.removeAll()
        populateMock()
    }
    
    func updateExchangeRate(_ rate: PPExchangeRate) {
        exchangeRate = rate
    }
    
    // MARK:- Hardcode Data Load
    
    private(set) var transactions = [PPTransaction]()
    private(set) var exchangeRate: PPExchangeRate?
    
    private func populateMock() {
        switch senderCountry {
        case .usa:
            addTransaction(PPTransaction(receiverFName: "John", receiverLName: "Mow", receiveCountry: .kenya, sendAmt: 2))
            addTransaction(PPTransaction(receiverFName: "Alex", receiverLName: "Peter", receiveCountry: .uganda, sendAmt: 8))
            addTransaction(PPTransaction(receiverFName: "Peter", receiverLName: "Josh", receiveCountry: .nigeria, sendAmt: 22))
            break
        case .kenya, .nigeria, .uganda:
            break
        case .binaria:
            addTransaction(PPTransaction(receiverFName: "John", receiverLName: "Mow", receiveCountry: .kenya, sendAmt: 2))
            addTransaction(PPTransaction(receiverFName: "Alex", receiverLName: "Peter", receiveCountry: .uganda, sendAmt: 8))
            addTransaction(PPTransaction(receiverFName: "Peter", receiverLName: "Josh", receiveCountry: .nigeria, sendAmt: 22))
            break
        }
    }
    
    public func addTransaction(_ transaction: PPTransaction) {
        transactions.insert(transaction, at: 0)
    }
    
    public func allTransaction() -> [PPTransaction] {
        return transactions
    }
}

