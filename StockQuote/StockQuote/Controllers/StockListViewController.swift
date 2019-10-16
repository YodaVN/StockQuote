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
    let cellId = "StockCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.largeTitleDisplayMode = .always
        
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "StockDetailCell", bundle: nil), forCellReuseIdentifier: cellId)
        
//        StockClient.shared.fetchStocks { (stocks, error) in
//
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension StockListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! StockDetailCell
        let viewModel = viewModels[indexPath.row]
        viewModel.config(cell)
        
        return cell
    }
}

extension StockListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
