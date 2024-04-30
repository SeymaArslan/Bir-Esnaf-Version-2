//
//  PurchaseTransactionsViewController.swift
//  Bir Esnaf MVVM
//
//  Created by Seyma Arslan on 29.04.2024.
//

import UIKit
import SnapKit

class PurchaseTransactionsViewController: UIViewController {

    var tableView = UITableView()
    var purchases: [Purchase] = []
    
    struct Cells {
        static let purCell = "PuchaseCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setTableViewDelegates()
        purchases = fetchData()
        configureTableView()
        createAddButton()
        createRefresh()
    }
    

    //MARK: - Button Actions
    @objc func addButtonTap() {
        let addProdVC = AddProductViewController()
        present(addProdVC, animated: true)
    }
    
    
    //MARK: - Views
    func createAddButton() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTap))
        navigationItem.rightBarButtonItem = addButton
    }
    
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates() // set delegates
        tableView.rowHeight = 130 // set row height
        tableView.register(PurchaseTableViewCell.self, forCellReuseIdentifier: Cells.purCell) // register cells
        tableView.backgroundColor = UIColor(named: Colors.background)
        
        tableView.snp.makeConstraints { make in  // set constraints
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    
    func setTableViewDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    //MARK: - Helpers
    func showDeleteWarning(for indexPath: IndexPath) {
        let alertController = UIAlertController(title: "You are about to delete the product", message: "Click Ok to continue", preferredStyle: .alert)
        let cancelAct = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(cancelAct)
        let okAct = UIAlertAction(title: "Ok", style: .destructive) { action in
            self.deleteProduct(at: indexPath)
        }
        alertController.addAction(okAct)
        self.present(alertController, animated: true)
    }
    
    func deleteProduct(at indexPath: IndexPath) {
        print("delete items")
    }
    
    func createRefresh() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    @objc func refresh(_ sender: Any) {
        if let refreshControl = sender as? UIRefreshControl, refreshControl.isRefreshing {
            print("Get data function")
            refreshControl.endRefreshing()
        }
    }
    
}


//MARK: - Extensions
extension PurchaseTransactionsViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return purchases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.purCell) as! PurchaseTableViewCell  
        let purchase = purchases[indexPath.row]
        cell.set(purchase: purchase)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPurchase = purchases[indexPath.row]
        let updatePurchase = UpdatePurchaseTransactionsViewController()
        updatePurchase.selectedPurchase = selectedPurchase
        present(updatePurchase, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAct = UIContextualAction(style: .destructive, title: "Sil") { contextualAction, view, boolValue in
            self.showDeleteWarning(for: indexPath)
        }
        return UISwipeActionsConfiguration(actions: [deleteAct])
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("Scroll")
        if let refreshControl = scrollView.refreshControl, refreshControl.isRefreshing {
            print("Get data function")
            refreshControl.endRefreshing()
        }
    }
    
}


extension PurchaseTransactionsViewController {
    
    func fetchData() -> [Purchase] {
        let data = Purchase(buyId: "1", userMail: "@test.com", compName: "Deneme", productName: "Deneme", price: "123.65", total: "30", totalPrice: "3709.5", buyDate: "29/04/2024", count: "5")
        
        let data2 = Purchase(buyId: "2", userMail: "@test.com", compName: "test", productName: "test", price: "123.65", total: "30", totalPrice: "3709.5", buyDate: "29/04/2024", count: "5")
        return [data, data2]
    }
}
