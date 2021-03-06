//
//  Budget.swift
//  MoneyCents
//
//  Created by Conqueriings on 19/11/21.
//

import Foundation
import SwiftUI

struct Budget: Identifiable, Equatable, Codable {
    var id = UUID()
    var name: String
    var amount: Double 
}
