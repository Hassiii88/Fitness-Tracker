//
//  FitnessEntry.swift
//  Fitness Tracker
//
//  Created by Haseeb Farooq on 19/04/2026.
//


import Foundation
import FirebaseFirestore

struct FitnessEntry: Identifiable, Codable {
    @DocumentID var id: String?
    var date: Date
    var steps: Int
    var workoutMinutes: Int
    var calories: Int
    var exerciseType: String
}