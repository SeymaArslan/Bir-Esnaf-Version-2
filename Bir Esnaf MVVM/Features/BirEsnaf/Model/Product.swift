//
//  Product.swift
//  Bir Esnaf MVVM
//
//  Created by Seyma Arslan on 16.04.2024.
//

import Foundation

struct ProductData {
    let product: [Product]
}

struct Product {
    let prodId: String
    let userMail: String
    let prodName: String
    let prodTotal: String
    let prodPrice: String
    let count: String
}
