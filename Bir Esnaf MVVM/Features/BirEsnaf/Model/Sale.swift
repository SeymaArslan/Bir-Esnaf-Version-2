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
    let totalPrice: String // toplam fiyat
    let productPrice: String // satış fiyatı
    let quantityOrPiece: String // miktar/adet
    let saleDate: String
    let count: String
}
