//
//  LogData.swift
//  MoneyCents
//
//  Created by Conqueriings on 22/11/21.
//

import Foundation
import SwiftUI

class LogData: ObservableObject {
    @Published var logs: [Log] = []
    
    let sampleLogs = [
        Log(name: "Milo", icon: "fork.knife", dateSelector:Date(timeIntervalSinceReferenceDate: 658316460), amount: 0.80, category: "Food", details: "During break"),
        Log(name: "Bus", icon: "bus", dateSelector:Date(timeIntervalSinceReferenceDate: 658316460), amount: 1.50, category: "Transport", details: "transport"),
        Log(name: "Movie", icon: "theatermasks.fill", dateSelector:Date(timeIntervalSinceReferenceDate: 658316460), amount: 13.00, category: "Entertainment", details: "Entertainment"),
        Log(name: "Pen", icon: "bag", dateSelector:Date(timeIntervalSinceReferenceDate: 658516460), amount: 1.70, category: "Default", details: "Ran out of ink"),
    ]
    
    func getArchiveURL() -> URL {
        let plistName = "logs.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedLogs = try? propertyListEncoder.encode(logs)
        try? encodedLogs?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finalLogs: [Log]!
        
        if let retrievedLogData = try? Data(contentsOf: archiveURL),
            let decodedLogs = try? propertyListDecoder.decode([Log].self, from: retrievedLogData) {
            finalLogs = decodedLogs
        } else {
            finalLogs = sampleLogs
        }
        
        logs = finalLogs
    }
}
