//
//  CompanyTableViewCell.swift
//  Bir Esnaf MVVM
//
//  Created by Seyma Arslan on 18.04.2024.
//

import UIKit
import SnapKit

class CompanyTableViewCell: UITableViewCell {

    var companyTitle = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(companyTitle)
        
        configureTitle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(company: Company) {
        companyTitle.text = company.compName
    }
    
    func configureTitle() {
        companyTitle.textColor = UIColor(named: "labelColor")
        companyTitle.numberOfLines = 2
        companyTitle.textAlignment = .center
//        companyTitle.adjustsFontSizeToFitWidth = true
        companyTitle.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
        }
    }
    
}
 
