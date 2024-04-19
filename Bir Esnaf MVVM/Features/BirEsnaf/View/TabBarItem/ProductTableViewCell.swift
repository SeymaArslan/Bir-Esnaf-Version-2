//
//  CompanyTableViewCell.swift
//  Bir Esnaf MVVM
//
//  Created by Seyma Arslan on 16.04.2024.
//  am ve co ya size ekle yazı boyutu ve değerlerini yanına sabitle 

import UIKit
import SnapKit

class ProductTableViewCell: UITableViewCell {
    
    var productTitle = UILabel()
    var view = UIView()
    var costTitle = UILabel()
    var cost = UILabel()
    var amountTitle = UILabel()
    var amount = UILabel()

    struct Color {
        static let labelColor = "labelColor2"
        static let viewColor = "customColor2"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
  
        addSubview(productTitle)
        addSubview(view)
        addSubview(costTitle)
        addSubview(cost)
        addSubview(amountTitle)
        addSubview(amount)
        
        configureProdTitle()
        configureView()
        configureCost()
        configureAmount()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(product: Product) {
        productTitle.text = product.prodName
        costTitle.text = "Cost:"
        cost.text = product.prodPrice
        amountTitle.text = "Amount:"
        amount.text = product.prodTotal
    }
    
    func configureProdTitle() {
        productTitle.textColor = UIColor(named: Color.labelColor)
        productTitle.numberOfLines = 0
        productTitle.adjustsFontSizeToFitWidth = true
        productTitle.snp.makeConstraints { make in
            make.top.equalTo(15)
            make.leading.equalTo(10)
            make.trailing.equalTo(10)
        }
    }
    
    func configureView() {
        view.backgroundColor = UIColor(named: Color.viewColor)
        view.snp.makeConstraints { make in
            make.top.equalTo(45)
            make.leading.equalTo(10)
            make.height.equalTo(2)
            make.width.equalTo(325)
        }
    }
    
    
    func configureCost() {
        costTitle.textColor = UIColor(named: Color.labelColor)
        
        costTitle.snp.makeConstraints { make in
            make.top.equalTo(55)
            make.leading.equalTo(17)
        }
        
        cost.textColor = UIColor(named: Color.labelColor)
        cost.snp.makeConstraints { make in
//            make.top.equalTo(25)    // özel bir şey yaparsan kullan eşit olmasını istemediğinde mesela..
            make.leading.equalTo(costTitle.snp.trailing).offset(10) // costTitle'ın hemen yanına yerleştir
            make.centerY.equalTo(costTitle)
            make.trailing.lessThanOrEqualToSuperview().inset(10) // Sağ kenara kısmen yaklaştır
        }
    }
    
    func configureAmount() {
        amountTitle.textColor = UIColor(named: Color.labelColor)
        amountTitle.snp.makeConstraints { make in
            make.top.equalTo(80)
            make.leading.equalTo(17)
        }
        
        amount.textColor = UIColor(named: Color.labelColor)
        amount.snp.makeConstraints { make in
            make.leading.equalTo(amountTitle.snp.trailing).offset(10)
            make.centerY.equalTo(amountTitle)
            make.trailing.lessThanOrEqualToSuperview().inset(10)
        }
    }
}
