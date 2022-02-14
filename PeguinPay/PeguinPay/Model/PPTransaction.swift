//
//  PPTransaction.swift
//  PeguinPay
//
//  Created by Md Shohrab Hossain on 2/13/22.
//

import Foundation

struct PPTransaction {
    let transactionID: String
    let senderID: String
    let receiverID: String
    let receiverFName: String
    let receiverLName: String
    let date: Date
    let sendAmt: Double
    let receiveCountry: PPCountry
    
    init(receiverFName: String,
         receiverLName: String,
         receiveCountry: PPCountry,
         sendAmt: Double
    ) {
        self.transactionID = UUID().uuidString
        self.senderID = UUID().uuidString
        self.receiverID = UUID().uuidString
        self.receiverFName = receiverFName
        self.receiverLName = receiverLName
        self.date = Date()
        self.sendAmt = sendAmt
        self.receiveCountry = receiveCountry
    }
}

