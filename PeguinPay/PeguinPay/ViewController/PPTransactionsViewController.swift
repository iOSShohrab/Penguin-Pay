//
//  PPTransactionsViewController.swift
//  PeguinPay
//
//  Created by Md Shohrab Hossain on 2/13/22.
//

import Foundation
import UIKit

class PPTransactionsViewController: UIViewController {
    @IBOutlet var transactionTableView: UITableView!
    
    let cellIdentifier = "cellTransaction"
    
    let viewModel = PPTransactionViewModel()
    
    var transactions: [PPTransaction]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchTransaction()
    }
    
    private func fetchTransaction() {
        viewModel.fetchTransactions { [weak self] t in
            self?.transactions = t
            DispatchQueue.main.async {
                self?.configTable()
            }
        }
    }
    
    private func configTable() {
        transactionTableView.rowHeight = 65.0
        transactionTableView.delegate = self
        transactionTableView.dataSource = self
        transactionTableView.reloadData()
    }
}

extension PPTransactionsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! PPTransactionCell
        if let transaction = transactions?[indexPath.row] {
            cell.transactionViewModel = transaction
            let (vSend, vReceive) = viewModel.visiableValues(transaction: transaction)
            cell.sendMoney.text = vSend
            cell.receivedMoney.text = vReceive
        }
        return cell
    }
}

extension PPTransactionsViewController: UITableViewDelegate {
    
}


