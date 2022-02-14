//
//  PPTransactionCell.swift
//  PeguinPay
//
//  Created by Md Shohrab Hossain on 2/13/22.
//

import Foundation
import UIKit

class PPTransactionCell: UITableViewCell {
    
    @IBOutlet var userName: UILabel!
    @IBOutlet var transactionDate: UILabel!
    @IBOutlet var sendMoney: UILabel!
    @IBOutlet var receivedMoney: UILabel!
    
    var transactionViewModel: PPTransaction? {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        if let model = transactionViewModel {
            userName.text = "\(model.receiverFName) \(model.receiverLName)"
            transactionDate.text = model.date.stringValue
        }
    }
}
