//
//  FitnessViewModel.swift
//  Fitness Tracker
//
//  Created by Haseeb Farooq on 19/04/2026.
//


import Foundation
import Combine

class FitnessViewModel: ObservableObject {
    
    @Published var entries: [FitnessEntry] = []
    
    let service = FirebaseService()
    
    init() {
        loadData()
    }
    
    func loadData() {
        service.fetchEntries { data in
            DispatchQueue.main.async {
                self.entries = data
            }
        }
    }
    
    func addEntry(steps: Int, workout: Int, calories: Int, type: String) {
        
        let newEntry = FitnessEntry(
            date: Date(),
            steps: steps,
            workoutMinutes: workout,
            calories: calories,
            exerciseType: type
        )
        
        service.addEntry(newEntry)
    }
    
    //  total calories
    func totalCalories() -> Int {
        entries.reduce(0) { $0 + $1.calories }
    }
    
    func totalSteps() -> Int {
        entries.reduce(0) { $0 + $1.steps }
    }
}

