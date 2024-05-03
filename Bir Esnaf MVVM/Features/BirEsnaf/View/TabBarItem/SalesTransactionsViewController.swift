//
//  SalesTransactionsViewController.swift
//  Bir Esnaf MVVM
//
//  Created by Seyma Arslan on 29.04.2024.
//

import UIKit
import SnapKit

class SalesTransactionsViewController: UIViewController {

    var tableView = UITableView()
    var sales: [Sale] = []
    
    struct Cells {
        static let saleCell = "SaleCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureLeftButton()
        setTableViewDelegates()
        sales = fetchData()
        configureTableView()
        createAddButton()
        createRefresh()
    }
    
    
    //MARK: - Button Actions
    @objc func backButtonPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func addButtonTap() {
        let addPurTransVC = AddSalesTransactionsViewController()
        present(addPurTransVC, animated: true)
    }
    
    
    //MARK: - UIs
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 162
        tableView.register(SalesTableViewCell.self, forCellReuseIdentifier: Cells.saleCell)
        tableView.backgroundColor = UIColor(named: Colors.background)
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func configureLeftButton() {
        navigationItem.hidesBackButton = false
        navigationItem.title = "Sales Transactions"
        self.navigationItem.leftBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: #selector(self.backButtonPressed))]
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor(named: Colors.blue)
    }

    func createAddButton() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTap))
        navigationItem.rightBarButtonItem = addButton
        navigationItem.rightBarButtonItem?.tintColor = UIColor(named: Colors.blue)
    }
    

    //MARK: - Helpers
    func showDeleteWarning(for indexPath: IndexPath) {
        let alertController = UIAlertController(title: "You are about to delete the Sale Transaction", message: "Click Ok to continue", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(cancelAction)
        let okAction = UIAlertAction(title: "Ok", style: .destructive) { action in
            self.deleteSalesTransaction(at: indexPath)
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
    }
    
    func deleteSalesTransaction(at indexPath: IndexPath) {
        print("deleteSalesTransaction")
    }
    
    func createRefresh() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    @objc func refresh(_ sender: Any) {
        if let refreshControl = sender as? UIRefreshControl, refreshControl.isRefreshing {
            refreshControl.endRefreshing()
        }
    }
}


//MARK: - Extensions
extension SalesTransactionsViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sales.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.saleCell) as! SalesTableViewCell
        let sale = sales[indexPath.row]
        cell.set(sale: sale)
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { contextualAction, view, boolValue in
            self.showDeleteWarning(for: indexPath)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let refreshControl = scrollView.refreshControl, refreshControl.isRefreshing {
            refreshControl.endRefreshing()
        }
    }
}



extension SalesTransactionsViewController {
    func fetchData() -> [Sale]{
        let data = Sale(saleId: "1", userMail: "test@", prodName: "Test", totalPrice: "1256", productPrice: "123", quantityOrPiece: "5", saleDate: "03/5/2024", count: "3")
        let data2 = Sale(saleId: "2", userMail: "test@", prodName: "Test2", totalPrice: "500", productPrice: "5", quantityOrPiece: "100", saleDate: "06/05/2024", count: "5")
        return [data, data2]
    }
}
