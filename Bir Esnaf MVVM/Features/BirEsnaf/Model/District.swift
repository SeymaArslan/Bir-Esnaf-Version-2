//
//  District.swift
//  Bir Esnaf MVVM
//
//  Created by Seyma Arslan on 29.04.2024.
//

import Foundation

struct DistrictData: Codable {
    let district: [District]
}

struct District: Codable {
    let dId: String
    let district: String
}
