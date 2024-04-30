//
//  Shop.swift
//  Bir Esnaf MVVM
//
//  Created by Seyma Arslan on 29.04.2024.
//

import Foundation

struct ShopData: Codable {
    let shop: [Shop]
}

struct Shop: Codable {
    let shopId: String
    let userMail: String
    let prodName: String
    let totalProfitAmount: String
    let count: String
}
