//
//  PPCustomTextField.swift
//  PeguinPay
//
//  Created by Md Shohrab Hossain on 2/13/22.
//

import Foundation
import Foundation
import UIKit

class PPCustomTextField: UITextField {
    

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
            return CGRect(x: 0, y: -0.5, width: 40, height: bounds.height)
    }
    
    func initialize(for country: PPCountry = .usa, addLeft: Bool = false, hasDigit: Bool = false) {
        if addLeft { self.addLeftView(country) }
        self.addDoneButtonOnKeyboard()
        self.keyboardType = hasDigit ? .decimalPad : .default
    }
    
    
}

extension UITextField {
    func addLeftView(_ country: PPCountry) {
        let label = UILabel()
        self.leftViewMode = .always
        label.textAlignment = .center
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = country.currency()
        self.leftView = label
    }
    
    func addDoneButtonOnKeyboard() {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil,
                                            action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self,
                                         action: #selector(resignFirstResponder))
        keyboardToolbar.items = [flexibleSpace, doneButton]
        self.inputAccessoryView = keyboardToolbar
    }
}
