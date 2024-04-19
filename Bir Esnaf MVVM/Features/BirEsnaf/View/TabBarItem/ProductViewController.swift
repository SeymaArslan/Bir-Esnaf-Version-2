//
//  ProductViewController.swift
//  Bir Esnaf MVVM
//
//  Created by Seyma Arslan on 16.04.2024.
//

import UIKit
import SnapKit

class ProductViewController: UIViewController {

    var tableView = UITableView()
    var products: [Product] = []
    
    struct Cells {
        static let prodCell = "ProductCell"
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableViewDelegates()
        products = fetchData()
        configureTableView()
        
        view.backgroundColor = UIColor(named: "backgroundColor")
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTap))
        
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addButtonTap() {
        print("Add button tapped")
    }
    
    
    //MARK: - Views
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates() // set delegates
        tableView.rowHeight = 120 // set row height
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: Cells.prodCell) // register cells
        
        
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
}


//MARK: - Extensions
extension ProductViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.prodCell) as! ProductTableViewCell
        let product = products[indexPath.row]
        cell.set(product: product)
        return cell
    }
}


extension ProductViewController {
    func fetchData() -> [Product] {
        let data = Product(prodId: "1", userMail: "deneme", prodName: "deneme", prodTotal: "50", prodPrice: "12.5 tl", count: "2")
        let data2 = Product(prodId: "2", userMail: "deneme2", prodName: "deneme2", prodTotal: "100", prodPrice: "55 tl", count: "deneme2")
        let data3 = Product(prodId: "3", userMail: "deneme3", prodName: "deneme3", prodTotal: "30", prodPrice: "120 tl", count: "deneme3")
        return [data, data2, data3]
    }
}
