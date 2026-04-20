//
//  AddActivityView.swift
//  Fitness Tracker
//
//  Created by Haseeb Farooq on 19/04/2026.
//


import SwiftUI

struct AddActivityView: View {
    
    @StateObject var vm = FitnessViewModel()
    
    @State var steps = ""
    @State var workout = ""
    @State var calories = ""
    @State var type = ""
    
    var body: some View {
        
        VStack(spacing: 15) {
            
            Text("Add Activity")
                .font(.largeTitle.bold())
            
            TextField("Steps", text: $steps)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
            
            TextField("Workout Minutes", text: $workout)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
            
            TextField("Calories", text: $calories)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
            
            TextField("Exercise Type", text: $type)
                .textFieldStyle(.roundedBorder)
            
            Button("Save Activity") {
                
                vm.addEntry(
                    steps: Int(steps) ?? 0,
                    workout: Int(workout) ?? 0,
                    calories: Int(calories) ?? 0,
                    type: type
                )
                
                steps = ""
                workout = ""
                calories = ""
                type = ""
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(12)
            
            Spacer()
        }
        .padding()
    }
}

