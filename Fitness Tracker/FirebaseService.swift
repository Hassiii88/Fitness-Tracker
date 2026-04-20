//
//  FirebaseService.swift
//  Fitness Tracker
//
//  Created by Haseeb Farooq on 19/04/2026.
//


import Foundation
import FirebaseFirestore

class FirebaseService {
    
    private let db = Firestore.firestore()
    
    // ➕ Add Data
    func addEntry(_ entry: FitnessEntry) {
        do {
            try db.collection("fitness").addDocument(from: entry)
        } catch {
            print("Error saving data: \(error)")
        }
    }
    
    // 📥 Fetch Data (real-time)
    func fetchEntries(completion: @escaping ([FitnessEntry]) -> Void) {
        db.collection("fitness")
            .order(by: "date", descending: true)
            .addSnapshotListener { snapshot, error in
                
                guard let docs = snapshot?.documents else {
                    completion([])
                    return
                }
                
                let entries = docs.compactMap {
                    try? $0.data(as: FitnessEntry.self)
                }
                
                completion(entries)
            }
    }
}