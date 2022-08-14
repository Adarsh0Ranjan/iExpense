//
//  ExpenseItem.swift
//  project-7-iExoense
//
//  Created by Roro Solutions on 14/08/22.
//

import Foundation
struct ExpenseItem: Identifiable, Codable{
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}
