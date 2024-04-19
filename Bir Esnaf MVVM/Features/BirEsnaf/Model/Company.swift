//
//  Company.swift
//  Bir Esnaf MVVM
//
//  Created by Seyma Arslan on 16.04.2024.
//

import Foundation

struct CompanyData {
    let company: [Company]
}

struct Company {
    let cId: String
    let userMail: String
    let compName: String
    let compPhone: String
    let compMail: String
    let province: String   // il
    let district: String  // ilce
    let quarter: String // mahalle
    let asbn: String // avenue/street/building/number
    let bankName: String
    let bankBranchName: String
    let bankBranchCode: String
    let bankAccountType: String
    let bankAccountName: String
    let bankAccountNum: String
    let bankIban: String
    let count: String
}

