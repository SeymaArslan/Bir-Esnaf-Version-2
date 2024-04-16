//
//  CompanyTableViewCell.swift
//  Bir Esnaf MVVM
//
//  Created by Seyma Arslan on 16.04.2024.
//

import UIKit
import SnapKit

class ProductTableViewCell: UITableViewCell {
    
    var productTitle = UILabel()
    var view = UIView()
    var costTitle = UILabel()
    var cost = UILabel()
    var amountTitle = UILabel()
    var amount = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
  
        addSubview(productTitle)
        addSubview(view)
//        addSubview(costTitle)
//        addSubview(amountTitle)
//        addSubview(amount)
        
        configureProdTitle()
//        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureProdTitle() {
        productTitle.numberOfLines = 0
        productTitle.adjustsFontSizeToFitWidth = true
        productTitle.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.leading.equalTo(10)
            make.trailing.equalTo(10)
        }
    }
    
    func configureView() {
        view.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(2)
            make.width.equalTo(110)
        }
    }

}
