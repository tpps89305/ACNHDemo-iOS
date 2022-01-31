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
    
    static func getAllDailyTask() -> [DailyTask] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Cannot get AppDelegate!")
        }
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<DailyTask>(entityName: Constant.EntityName.dailyTask)
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        let fetchResultController = NSFetchedResultsController(
            fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)

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
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Cannot get AppDelegate!")
        }
        let context = appDelegate.persistentContainer.viewContext
        
        addDailyTask1(context: context)
        addDailyTask2(context: context)
        addDailyTask3(context: context)
        addDailyTask4(context: context)
        addDailyTask5(context: context)
        addDailyTask6(context: context)
        addDailyTask7(context: context)
        addDailyTask8(context: context)
    }
    
    private static func addDailyTask1(context: NSManagedObjectContext) {
        guard let dailyTask = NSEntityDescription.insertNewObject(forEntityName: Constant.EntityName.dailyTask, into: context)
                as? DailyTask else {
            fatalError("Cannot inser new daily task!")
        }

        dailyTask.name = "Progress 1"
        dailyTask.iconName = R.image.oreIron.name
        dailyTask.currentValue = 0
        dailyTask.maxValue = 3
        
        do {
            try context.save()
            print("Add daily task \(String(describing: dailyTask.name)) success.")
        } catch {
            fatalError("\(error)")
        }
    }
    
    private static func addDailyTask2(context: NSManagedObjectContext) {
        guard let dailyTask = NSEntityDescription.insertNewObject(forEntityName: Constant.EntityName.dailyTask, into: context)
                as? DailyTask else {
            fatalError("Cannot inser new daily task!")
        }
        
        dailyTask.name = "Progress 2"
        dailyTask.iconName = R.image.fossil_NH_Inv_Icon.name
        dailyTask.currentValue = 0
        dailyTask.maxValue = 3
        
        do {
            try context.save()
            print("Add daily task \(String(describing: dailyTask.name)) success.")
        } catch {
            fatalError("\(error)")
        }
    }
    
    private static func addDailyTask3(context: NSManagedObjectContext) {
        guard let dailyTask = NSEntityDescription.insertNewObject(forEntityName: Constant.EntityName.dailyTask, into: context)
                as? DailyTask else {
            fatalError("Cannot inser new daily task!")
        }
        
        dailyTask.name = "Progress 3"
        dailyTask.iconName = R.image.pietro_PC_icon.name
        dailyTask.currentValue = 0
        dailyTask.maxValue = 3
        
        do {
            try context.save()
            print("Add daily task \(String(describing: dailyTask.name)) success.")
        } catch {
            fatalError("\(error)")
        }
    }
    
    private static func addDailyTask4(context: NSManagedObjectContext) {
        guard let dailyTask = NSEntityDescription.insertNewObject(forEntityName: Constant.EntityName.dailyTask, into: context)
                as? DailyTask else {
            fatalError("Cannot inser new daily task!")
        }
        
        dailyTask.name = "Progress 4"
        dailyTask.iconName = R.image.furniture_NH_Inv_Icon.name
        dailyTask.currentValue = 0
        dailyTask.maxValue = 3
        
        do {
            try context.save()
            print("Add daily task \(String(describing: dailyTask.name)) success.")
        } catch {
            fatalError("\(error)")
        }
    }
    
    private static func addDailyTask5(context: NSManagedObjectContext) {
        guard let dailyTask = NSEntityDescription.insertNewObject(forEntityName: Constant.EntityName.dailyTask, into: context)
                as? DailyTask else {
            fatalError("Cannot inser new daily task!")
        }
        
        dailyTask.name = "Progress 5"
        dailyTask.iconName = R.image.bell.name
        dailyTask.currentValue = 0
        dailyTask.maxValue = 3
        
        do {
            try context.save()
            print("Add daily task \(String(describing: dailyTask.name)) success.")
        } catch {
            fatalError("\(error)")
        }
    }
    
    private static func addDailyTask6(context: NSManagedObjectContext) {
        guard let dailyTask = NSEntityDescription.insertNewObject(forEntityName: Constant.EntityName.dailyTask, into: context)
                as? DailyTask else {
            fatalError("Cannot inser new daily task!")
        }
        
        dailyTask.name = "Progress 6"
        dailyTask.iconName = R.image.planeTicket.name
        dailyTask.currentValue = 0
        dailyTask.maxValue = 3
        
        do {
            try context.save()
            print("Add daily task \(String(describing: dailyTask.name)) success.")
        } catch {
            fatalError("\(error)")
        }
    }
    
    private static func addDailyTask7(context: NSManagedObjectContext) {
        guard let dailyTask = NSEntityDescription.insertNewObject(forEntityName: Constant.EntityName.dailyTask, into: context)
                as? DailyTask else {
            fatalError("Cannot inser new daily task!")
        }
        
        dailyTask.name = "Progress 7"
        dailyTask.iconName = R.image.message_Bottle.name
        dailyTask.currentValue = 0
        dailyTask.maxValue = 3
        
        do {
            try context.save()
            print("Add daily task \(String(describing: dailyTask.name)) success.")
        } catch {
            fatalError("\(error)")
        }
    }
    
    private static func addDailyTask8(context: NSManagedObjectContext) {
        guard let dailyTask = NSEntityDescription.insertNewObject(forEntityName: Constant.EntityName.dailyTask, into: context)
                as? DailyTask else {
            fatalError("Cannot inser new daily task!")
        }
        
        dailyTask.name = "Progress 8"
        dailyTask.iconName = R.image.recipe.name
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
        let array = getAllDailyTask()
        for each in array {
            each.currentValue = 0
            updateDailyTask(dailyTask: each)
        }
    }
}
