//
//  ContentView.swift
//  p1n3appl3
//
//  Created by Yikun Zhou on 15/11/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            // Home
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            // History
            HistoryView()
                .tabItem {
                    Label("History", systemImage: "chart.xyaxis.line")
                }
            
            //Budget
            BudgetView()
                .tabItem {
                    Label("Budget", systemImage: "dollarsign.circle")
                }
            
            // Goals
            GoalsView()
                .tabItem {
                    Label("Goals", systemImage: "list.dash")
                }
            
            // Settings
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}