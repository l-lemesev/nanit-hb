//
//  UserInput.swift
//  Nanit Happy Birthday
//
//  Created by Leo Lemesev on 8/5/21.
//

import Foundation
import UIKit


struct UserInput: Codable {
    
    var name: String?
    
    var birthday: Date?
    
    var pictureData: Data?
    
    
    private static let persistenceKey = "user.input"
    
    
    static func fromPersistence() -> UserInput? {
        guard let inputData = UserDefaults.standard.object(forKey: UserInput.persistenceKey) as? Data else { return nil }
        return try? JSONDecoder().decode(UserInput.self, from: inputData)
    }
    
    
    func save() {
        if let encoded = try? JSONEncoder().encode(self) {
            UserDefaults.standard.set(encoded, forKey: UserInput.persistenceKey)
        }
    }
}
