//
//  ContentView 2.swift
//  Fitness Tracker
//
//  Created by Haseeb Farooq on 19/04/2026.
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            
            DashboardView()
                .tabItem {
                    Label("Dashboard", systemImage: "chart.bar.fill")
                }
            
            AddActivityView()
                .tabItem {
                    Label("Add", systemImage: "plus.circle.fill")
                }
        }
    }
}
#Preview {
    ContentView()
}
