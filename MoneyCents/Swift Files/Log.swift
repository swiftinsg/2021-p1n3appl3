//
//  Log.swift
//  MoneyCents
//
//  Created by Conqueriings on 16/11/21.
//

import Foundation

// New log

struct Log: Identifiable, Equatable, Codable {
    var id = UUID()
    var name: String
    var icon: String 
    var dateSelector = Date()
    var amount: Double
    var category: String
    var details: String
}
