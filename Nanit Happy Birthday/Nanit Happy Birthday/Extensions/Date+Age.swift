//
//  Date+Age.swift
//  Nanit Happy Birthday
//
//  Created by Leo Lemesev on 8/7/21.
//

import Foundation


extension Date {
    
    func getAgeModel(name: String) -> AgeModel {
        let firstLine = "TODAY \(name.uppercased()) IS"
        let secondLine: String
        let imageName: String
        
        let yearsDiff = abs(years(from: Date()))
        
        if yearsDiff == 0 {
            let monthsDiff = abs(months(from: Date()))
            
            if monthsDiff == 1 {
                secondLine = "MONTH"
            } else {
                secondLine = "MONTHS"
            }
            
            imageName = "\(monthsDiff)"
        } else {
            if yearsDiff == 1 {
                secondLine = "YEAR"
            } else {
                secondLine = "YEARS"
            }
            
            imageName = "\(yearsDiff)"
        }
        
        
        return AgeModel(firstLine: firstLine, secondLine: secondLine + " OLD!", imageName: imageName)
    }
    
    
    func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    
    
    func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
}
