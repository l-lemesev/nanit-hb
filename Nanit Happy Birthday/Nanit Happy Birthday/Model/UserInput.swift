//
//  UserInput.swift
//  Nanit Happy Birthday
//
//  Created by Leo Lemesev on 8/5/21.
//

import Foundation


struct UserInput: Codable {
    
    var name: String
    
    var birthday: Date
    
    var pictureId: String
    
    
    private static let persistenceKey = "user.input"
    
    
//    static func fromPersistence() -> UserInput {
//
//    }
    
    
    func save() {
        if let encoded = try? JSONEncoder().encode(self) {
            UserDefaults.standard.set(encoded, forKey: UserInput.persistenceKey)
        }
    }
}
