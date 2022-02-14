//
//  PPHomeViewController.swift
//  PeguinPay
//
//  Created by Md Shohrab Hossain on 2/13/22.
//

import Foundation
import UIKit

class PPHomeViewController: UIViewController {
    let viewModel = PPHomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            self?.viewModel.fetchExchange()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func userResidencyChoiced(sender: UIButton) {
        switch sender.tag {
        case 101: triggerSegue(country: .usa); break
        case 102: triggerSegue(country: .binaria); break
        default: break
        }
    }
    
    private func triggerSegue(country: PPCountry) {
        PPMockData.shared.updateCountry(country: country)
        performSegue(withIdentifier: "sgTransactions", sender: nil)
    }
}
