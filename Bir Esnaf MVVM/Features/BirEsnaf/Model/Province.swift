//
//  Province.swift
//  Bir Esnaf MVVM
//
//  Created by Seyma Arslan on 29.04.2024.
//

import Foundation

struct ProvinceData: Codable {
    let province: [Province]
}

struct Province: Codable {
    let pId: String
    let province: String
}
