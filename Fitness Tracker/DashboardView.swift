//
//  DashboardView.swift
//  Fitness Tracker
//
//  Created by Haseeb Farooq on 19/04/2026.
//


import SwiftUI

struct DashboardView: View {
    
    @StateObject var vm = FitnessViewModel()
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Text("Fitness Dashboard")
                .font(.largeTitle.bold())
            
            // 📊 Stats
            HStack {
                StatCard(title: "Calories", value: "\(vm.totalCalories())")
                StatCard(title: "Steps", value: "\(vm.totalSteps())")
            }
            
            // 🔥 Progress
            ProgressView(value: Double(vm.totalCalories()), total: 5000)
                .padding()
            
            // 📋 List
            List(vm.entries) { item in
                
                VStack(alignment: .leading) {
                    Text("🏃 \(item.exerciseType)")
                        .bold()
                    Text("🔥 Calories: \(item.calories)")
                    Text("👟 Steps: \(item.steps)")
                    Text("⏱ \(item.workoutMinutes) min")
                }
            }
        }
        .padding()
        .onAppear {
            vm.loadData()
        }
    }
}

