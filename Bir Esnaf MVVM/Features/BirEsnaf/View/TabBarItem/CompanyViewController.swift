//
//  CompanyViewController.swift
//  Bir Esnaf MVVM
//
//  Created by Seyma Arslan on 16.04.2024.
//

import UIKit
import SnapKit

class CompanyViewController: UIViewController {

    var tableView = UITableView()
    var companies: [Company] = []
    
    struct Cells {
        static let compCell = "CompanyCell"
    }
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setTableViewDelegates()
        configureTableView()
        companies = fetchData()
        
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
        tableView.rowHeight = 75 // set row height
        tableView.register(CompanyTableViewCell.self, forCellReuseIdentifier: Cells.compCell) // register cells
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
    
}


//MARK: - Extensions
extension CompanyViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.compCell) as! CompanyTableViewCell
        let company = companies[indexPath.row]
        cell.set(company: company)
        return cell
    }
}


extension CompanyViewController {
    func fetchData() -> [Company] {
        let data = Company(cId: "1", userMail: "@mail", compName: "Firma1Firma1Firma1Firma1Firma1Firma1Firma1Firma1Firma1Firma1Firma1Firma1", compPhone: "05745867", compMail: "@firma", province: "Ankara", district: "Çankaya", quarter: "Koru", asbn: "Yeşiltepe Evleri", bankName: "YapıKredi", bankBranchName: "Bahçelievler", bankBranchCode: "34234", bankAccountType: "Try", bankAccountName: "Firma1", bankAccountNum: "2342352", bankIban: "TR00 0000 0000 0000", count: "Firma1")
        let data2 = Company(cId: "2", userMail: "@mail", compName: "Firma2", compPhone: "453453625", compMail: "@firma2mail", province: "Bursa", district: "Osmangazi", quarter: "Atatürk", asbn: "Paşa Mahallesi", bankName: "Garanti", bankBranchName: "Osmangazi", bankBranchCode: "34234", bankAccountType: "Try", bankAccountName: "Firma2", bankAccountNum: "2345234", bankIban: "TR00 0000 0000 0000", count: "Firma2")
        
        return [data, data2]
    }
}
