//
//  Purchase.swift
//  Bir Esnaf MVVM
//
//  Created by Seyma Arslan on 29.04.2024.
//

import Foundation

struct PurchaseData {
    let buy: [Purchase]
}

struct Purchase {
    let buyId: String
    let userMail: String
    let compName: String
    let productName: String
    let price: String
    let total: String
    let totalPrice: String
    let buyDate: String
    let count: String
}
