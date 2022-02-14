//
//  PPSendMoneyViewController.swift
//  PeguinPay
//
//  Created by Md Shohrab Hossain on 2/13/22.
//

import Foundation

import UIKit

class PPSendMoneyViewController: UIViewController {

    @IBOutlet weak var tfFirstName: PPCustomTextField!
    @IBOutlet weak var tfLastName: PPCustomTextField!
    @IBOutlet weak var tfCountry: PPCustomTextField!
    @IBOutlet weak var tfAmount: PPCustomTextField!
    @IBOutlet weak var tfAmountReceived: PPCustomTextField!
    
    @IBOutlet weak var dropDownView: UIView! {
        didSet {
            dropDownView.isHidden = true
        }
    }
    @IBOutlet weak var dropDownViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var dropdown: UIPickerView!
    
    var countries: [PPCountry] = [.kenya, .nigeria, .uganda]
    var sendCountry: PPCountry = .usa
    var selectedCountry: PPCountry = .kenya
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendCountry = PPMockData.shared.senderCountry
        updateTextFields(country: .usa)
        tfAmount.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        
        tfFirstName.placeholder = "First Name"
        tfLastName.placeholder = "Last Name"
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField == self.tfAmount {
            conversion()
        }
    }
    
    func conversion() {
        if sendCountry == .binaria {
            let amountInDec = tfAmount.text!.Decimal
            let convertedAmount = PPCurrency().covert(valueInUSD: Double(amountInDec) ?? 0, receiveCountry: selectedCountry)
            tfAmountReceived.text = "\(Int(convertedAmount.receiveAmout).toBinary)"
        } else {
            let convertedAmount = PPCurrency().covert(valueInUSD: Double(tfAmount.text!) ?? 0, receiveCountry: selectedCountry)
            tfAmountReceived.text = "\(convertedAmount.receiveAmout)"
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (sendCountry == .binaria && textField == tfAmount) {
            let aSet = NSCharacterSet(charactersIn:"01").inverted
            let compSepByCharInSet = string.components(separatedBy: aSet)
            let numberFiltered = compSepByCharInSet.joined(separator: "")
            return numberFiltered == string
        }
        return true
    }
    
    @IBAction func onDoneButtonTapped(_ sender: Any) {
        isDropDownHidden(true)
    }
    
    @IBAction func sendMoney() {
        let sendAmt = sendCountry == .binaria ? Double(tfAmount.text!.Decimal) ?? 0 : Double(tfAmount.text!) ?? 0
        
        if let fname = tfFirstName.text, let lname = tfLastName.text, sendAmt > 0 {
            PPMockData.shared.addTransaction(PPTransaction(receiverFName: fname,
                                                           receiverLName: lname,
                                                           receiveCountry: selectedCountry,
                                                           sendAmt: sendAmt))
            alertSuccess()
            
        }
        else {
            alertFail()
        }
    }
    
    private func alertSuccess() {
        let alert = UIAlertController(title: "Success", message: "Monet Sent !!", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    private func alertFail() {
        let alert = UIAlertController(title: "Fail", message: "Please review info", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension PPSendMoneyViewController: UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.view.endEditing(true)
        return countries[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        updateTextFields(country: self.countries[row])
        conversion()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == self.tfCountry {
            isDropDownHidden(false)
            //if you don't want the users to se the keyboard type:
            self.view.endEditing(true)
        }
    }
    
    func updateTextFields(country: PPCountry) {
        tfFirstName.initialize()
        tfLastName.initialize()
        tfCountry.text = country.rawValue
        selectedCountry = country
        tfAmount.initialize(for: sendCountry, addLeft: true, hasDigit: true)
        tfAmountReceived.initialize(for: country, addLeft: true, hasDigit: true)
    }
    
    func isDropDownHidden(_ hidden: Bool) {
        dropDownView.isHidden = hidden
    }
    
}
