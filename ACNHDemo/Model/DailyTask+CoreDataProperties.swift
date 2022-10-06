//
//  DailyTask+CoreDataProperties.swift
//  
//
//  Created by 楊朝富 on 2021/9/20.
//
//

import Foundation
import CoreData

extension DailyTask {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DailyTask> {
        return NSFetchRequest<DailyTask>(entityName: "DailyTask")
    }

    @NSManaged public var name: String?
    @NSManaged public var iconName: String?
    @NSManaged public var currentValue: Int32
    @NSManaged public var maxValue: Int32
    
    init(iconName: String, currentValue: Double, maxValue: Double) {
        self.iconName = iconName
        self.currentValue = currentValue
        self.maxValue = maxValue
    }

}
