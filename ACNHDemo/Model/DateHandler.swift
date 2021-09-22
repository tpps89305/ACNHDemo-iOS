//
//  DateHandler.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/9/21.
//

import UIKit

class DateHandler {
    
    static func getCurrentMonth() -> Int {
        let today = Date()
        let dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: today)
        return dateComponents.month!
    }
    
    static func getCurrentHour() -> Int {
        let today = Date()
        let dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: today)
        return dateComponents.hour!
    }
    
    static func getToday() -> String {
        let today = Date()
        let dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: today)
        return "\(dateComponents.day!)/\(dateComponents.month!)"
    }
    
}
