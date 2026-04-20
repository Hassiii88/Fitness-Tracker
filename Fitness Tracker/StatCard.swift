//
//  StatCard.swift
//  Fitness Tracker
//
//  Created by Haseeb Farooq on 19/04/2026.
//


import SwiftUI

struct StatCard: View {
    
    var title: String
    var value: String
    
    var body: some View {
        
        VStack {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            
            Text(value)
                .font(.title2.bold())
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(12)
    }
}