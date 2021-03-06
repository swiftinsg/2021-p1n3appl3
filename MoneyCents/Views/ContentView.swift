//
//  ContentView.swift
//  MoneyCents
//
//  Created by Yikun Zhou on 15/11/21.
//

import SwiftUI

struct ContentView: View {
    @Binding var logs: [Log]
    @Binding var budgets: [Budget]
    
    var body: some View {
        
        // Tab view
        TabView {
            
            // Home
            HomeView(logs: $logs, budgets: $budgets)
                .tabItem {
                    Image(uiImage: UIImage(systemName: "house")!.imageWithoutBaseline())
                    Text("Home")
                }
            
            // Reports
            ReportsView(logs: $logs)
                .tabItem {
                    Image(uiImage: UIImage(systemName: "chart.bar")!.imageWithoutBaseline())
                    Text("Reports")
                }
            
            //Budget
            BudgetView(budgets: $budgets, logs: $logs)
                .tabItem {
                    Image(uiImage: UIImage(systemName: "dollarsign.circle")!.imageWithoutBaseline())
                    Text("Categories")
                }
            
            // Goals
            /*
            GoalsView()
                .tabItem {
                    Image(uiImage: UIImage(systemName: "list.dash")!.imageWithoutBaseline())
                    Text("Goals")
                }
             */
            
            // Settings
            SettingsView()
                .tabItem {
                    Image(uiImage: UIImage(systemName: "gear")!.imageWithoutBaseline())
                    Text("Settings")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(logs: .constant([]), budgets: .constant([]))
    }
}
