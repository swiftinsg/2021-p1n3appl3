//
//  MoneyCentsApp.swift
//  MoneyCents
//
//  Created by Yikun Zhou on 15/11/21.
//

import SwiftUI

@main
struct MoneyCentsApp: App {
    
    @ObservedObject var logData = LogData()
    @ObservedObject var budgetData = BudgetData()
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView(logs: $logData.logs, budgets: $budgetData.budgets)
                .onAppear {
                    logData.load()
                    budgetData.load()
                }
                .onChange(of: scenePhase) { phase in
                    if phase == .inactive {
                        logData.save()
                        budgetData.save()
                    }
                }
        }
    }
}
