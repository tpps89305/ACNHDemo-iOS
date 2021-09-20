//
//  CoreDataHandler.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/9/20.
//

import Foundation
import UIKit
import CoreData

class CoreDataHandler {
    static func getDailyTask() -> [DailyTask] {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<DailyTask>(entityName: Constant.EntityName.DAILY_TASK)
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        let fetchResultController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
//        fetchResultController.delegate = self
        do {
            try fetchResultController.performFetch()
            if let fetchedObjects = fetchResultController.fetchedObjects {
                return fetchedObjects
            }
        } catch {
            fatalError("Cannot load daily task!")
        }
        return []
    }
    
    static func initDailyTask() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        var dailyTask = NSEntityDescription.insertNewObject(forEntityName: Constant.EntityName.DAILY_TASK, into: context) as! DailyTask

        dailyTask.name = "Progress 1"
        dailyTask.iconName = Constant.IconName.OREIRON
        dailyTask.currentValue = 0
        dailyTask.maxValue = 3
        
        do {
            try context.save()
            print("Add daily task \(String(describing: dailyTask.name)) success.")
        } catch {
            fatalError("\(error)")
        }
        
        dailyTask = NSEntityDescription.insertNewObject(forEntityName: Constant.EntityName.DAILY_TASK, into: context) as! DailyTask
        
        dailyTask.name = "Progress 2"
        dailyTask.iconName = Constant.IconName.FOSSIL
        dailyTask.currentValue = 0
        dailyTask.maxValue = 3
        
        do {
            try context.save()
            print("Add daily task \(String(describing: dailyTask.name)) success.")
        } catch {
            fatalError("\(error)")
        }
        
        dailyTask = NSEntityDescription.insertNewObject(forEntityName: Constant.EntityName.DAILY_TASK, into: context) as! DailyTask
        
        dailyTask.name = "Progress 3"
        dailyTask.iconName = Constant.IconName.PIETRO
        dailyTask.currentValue = 0
        dailyTask.maxValue = 3
        
        do {
            try context.save()
            print("Add daily task \(String(describing: dailyTask.name)) success.")
        } catch {
            fatalError("\(error)")
        }
        
        dailyTask = NSEntityDescription.insertNewObject(forEntityName: Constant.EntityName.DAILY_TASK, into: context) as! DailyTask
        
        dailyTask.name = "Progress 4"
        dailyTask.iconName = Constant.IconName.FURNITURE_NH
        dailyTask.currentValue = 0
        dailyTask.maxValue = 3
        
        do {
            try context.save()
            print("Add daily task \(String(describing: dailyTask.name)) success.")
        } catch {
            fatalError("\(error)")
        }
        
        dailyTask = NSEntityDescription.insertNewObject(forEntityName: Constant.EntityName.DAILY_TASK, into: context) as! DailyTask
        
        dailyTask.name = "Progress 5"
        dailyTask.iconName = Constant.IconName.BELL
        dailyTask.currentValue = 0
        dailyTask.maxValue = 3
        
        do {
            try context.save()
            print("Add daily task \(String(describing: dailyTask.name)) success.")
        } catch {
            fatalError("\(error)")
        }
        
        dailyTask = NSEntityDescription.insertNewObject(forEntityName: Constant.EntityName.DAILY_TASK, into: context) as! DailyTask
        
        dailyTask.name = "Progress 6"
        dailyTask.iconName = Constant.IconName.PLANE_TICKET
        dailyTask.currentValue = 0
        dailyTask.maxValue = 3
        
        do {
            try context.save()
            print("Add daily task \(String(describing: dailyTask.name)) success.")
        } catch {
            fatalError("\(error)")
        }
        
        dailyTask = NSEntityDescription.insertNewObject(forEntityName: Constant.EntityName.DAILY_TASK, into: context) as! DailyTask
        
        dailyTask.name = "Progress 7"
        dailyTask.iconName = Constant.IconName.MESSAGE_BOTTLE
        dailyTask.currentValue = 0
        dailyTask.maxValue = 3
        
        do {
            try context.save()
            print("Add daily task \(String(describing: dailyTask.name)) success.")
        } catch {
            fatalError("\(error)")
        }
        
        dailyTask = NSEntityDescription.insertNewObject(forEntityName: Constant.EntityName.DAILY_TASK, into: context) as! DailyTask
        
        dailyTask.name = "Progress 8"
        dailyTask.iconName = Constant.IconName.RECIPE
        dailyTask.currentValue = 0
        dailyTask.maxValue = 3

        do {
            try context.save()
            print("Add daily task \(String(describing: dailyTask.name)) success.")
        } catch {
            fatalError("\(error)")
        }
    }
    
    static func updateDailyTask(dailyTask: DailyTask) {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.saveContext()
        }
    }
    
    static func resetDailyTask() {
        let array = getDailyTask()
        for each in array {
            each.currentValue = 0
            updateDailyTask(dailyTask: each)
        }
    }
}
