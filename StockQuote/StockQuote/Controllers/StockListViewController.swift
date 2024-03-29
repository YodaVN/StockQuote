//
//  ViewController.swift
//  StockQuote
//
//  Created by Nhan Nguyen on 10/15/19.
//  Copyright © 2019 Nhan Nguyen. All rights reserved.
//

import UIKit

class StockListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var viewModels: [StockViewModel] = []
    var dataTask: URLSessionDataTask?
    let cellId = "StockCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.largeTitleDisplayMode = .always
        
        tableView.accessibilityIdentifier = "table--articleTableView"
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "StockDetailCell", bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        refreshData()
    }
    
    func createAlert() {
        let alert = UIAlertController(title: "Can't call API right now, please try again later", message: "", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        self.present(alert, animated: true)
    }
    
    func refreshData() {
        guard dataTask == nil else { return }
        
        dataTask = StockClient.shared.fetchStocks { (stocks, error) in
            self.viewModels = []
            self.dataTask = nil
            
            guard let data = stocks?.data else {
                DispatchQueue.main.async {
                    self.createAlert()
                }
                
                return
            }
            
            for i in 0..<data.count {
                self.viewModels.append(StockViewModel(datum: data[i]))
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension StockListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! StockDetailCell
        cell.selectionStyle = .none
        cell.dayChange.clipsToBounds = true
        cell.dayChange.layer.cornerRadius = 5
        let viewModel = viewModels[indexPath.row]
        viewModel.config(cell)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let stockDetailViewController = StockDetailViewController(nibName: "StockDetailView", bundle: nil)
        let model = viewModels[indexPath.row]
        stockDetailViewController.loadViewIfNeeded()
        
        stockDetailViewController.updateUI(symbol: model.symbol, name: model.name, dayHigh: model.dayHigh, dayLow: model.dayLow, dayChange: model.lastTradeTime)
        self.navigationController?.pushViewController(stockDetailViewController, animated: true)
    }
}

extension StockListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
