//
//  Sale.swift
//  Bir Esnaf MVVM
//
//  Created by Seyma Arslan on 29.04.2024.
//

import Foundation

struct SaleData: Codable {
    let sale: [Sale]
}

struct Sale: Codable {
    let saleId: String
    let userMail: String
    let prodName: String
    let salePrice: String
    let saleTotal: String
    let saleTotalPrice: String
    let saleDate: String
    let count: String
}
