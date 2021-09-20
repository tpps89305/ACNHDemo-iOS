//
// Created by 楊朝富 on 2021/8/10.
//

import Foundation
import UIKit
import CoreData

class DashboardVCViewModel {

    var arrayWeekday = ["日", "一", "二", "三", "四", "五", "六"]
    var dailyTaskCellViewModels: [DailyTaskCellViewModel] = []

    func getTodayInfo() -> String {
        let today = Date()
        let dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: today)
        let weekday = dateComponents.weekdayOrdinal!
        let month = dateComponents.month!
        let day = dateComponents.day!

        let result = "\(month) 月 \(day) 日 星期\(arrayWeekday[weekday])"
        print("Dashboard: \(result)")
        return result
    }
    
    func getAvailableFish(onCompleted: @escaping (Int) -> Void) {
        var arrayFishes = Array<Fish>()
        ACNHProvider.request(.fishes(fishId: 0)) { result in
            do {
                let response = try result.get()
                let fishes = try ACNHJSONDecoder().decode(Fishes.self, from: response.data)
                for eachKey in fishes.keys {
                    let eachFish = fishes[eachKey]!
                    if self.isAvailable(fish: eachFish) {
                        arrayFishes.append(eachFish)
                    }
                }
                
                // Sort to get same order array every time(s).
                arrayFishes.sort { (fish0, fish1) -> Bool in
                    fish0.fileName < fish1.fileName
                }
                onCompleted(arrayFishes.count)
                print("Success to get fishes!")
            } catch {
                print("Error when get fishes...")
            }
        }
    }
    
    func getAvailableSeaCreatures(onCompleted: @escaping (Int) -> Void) {
        var arraySeaCreatures = Array<SeaCreature>()
        ACNHProvider.request(.seaCreatures(seaCreatureId: 0)) { result in
            do {
                let response = try result.get()
                let seaCreatures = try ACNHJSONDecoder().decode(SeaCreatures.self, from: response.data)
                for eachKey in seaCreatures.keys {
                    let eachSeaCreature = seaCreatures[eachKey]!
                    if self.isAvailable(seaCreature: eachSeaCreature) {
                        arraySeaCreatures.append(seaCreatures[eachKey]!)
                    }
                }
                
                // Sort to get same order array every time(s).
                arraySeaCreatures.sort { (seaCreature0, seaCreature1) -> Bool in
                    seaCreature0.id < seaCreature1.id
                }
                onCompleted(arraySeaCreatures.count)
                print("Success to get sea creatures!")
            } catch {
                print("Error when get sea creatures...")
            }
        }
    }
    
    func getAvailableBugs(onCompleted: @escaping (Int) -> Void) {
        var arrayBugs = Array<Bug>()
        ACNHProvider.request(.bugs(bugId: 0)) { result in
            do {
                let response = try result.get()
                let bugs = try ACNHJSONDecoder().decode(Bugs.self, from: response.data)
                for eachKey in bugs.keys {
                    arrayBugs.append(bugs[eachKey]!)
                }
                
                // Sort to get same order array every time(s).
                arrayBugs.sort { (bug0, bug1) -> Bool in
                    bug0.id < bug1.id
                }
                onCompleted(arrayBugs.count)
                print("Success to get bugs!")
            } catch {
                print("Error when get bugs...")
            }
        }
    }
    
    private func isAvailable(fish: Fish) -> Bool {
        let today = Date()
        let dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: today)
        let month = dateComponents.month!
        let hour = dateComponents.hour
        if fish.availability.monthArrayNorthern.contains(month) || fish.availability.isAllYear {
            if fish.availability.timeArray.contains(hour!) || fish.availability.isAllDay {
                return true
            }
        }
        return false
    }
    
    private func isAvailable(seaCreature: SeaCreature) -> Bool {
        let today = Date()
        let dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: today)
        let month = dateComponents.month!
        let hour = dateComponents.hour
        if seaCreature.availability.monthArrayNorthern.contains(month) || seaCreature.availability.isAllYear {
            if seaCreature.availability.timeArray.contains(hour!) || seaCreature.availability.isAllDay {
                return true
            }
        }
        return false
    }
    
    private func isAvailable(bug: Bug) -> Bool {
        let today = Date()
        let dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: today)
        let month = dateComponents.month!
        let hour = dateComponents.hour
        if bug.availability.monthArrayNorthern.contains(month) || bug.availability.isAllYear {
            if bug.availability.timeArray.contains(hour!) || bug.availability.isAllDay {
                return true
            }
        }
        return false
    }

    func getDailyTasks(onRequestEnd: (() -> Void)?) {
        var arrayDailyTasks = CoreDataHandler.getDailyTask()
        if arrayDailyTasks.isEmpty {
            CoreDataHandler.initDailyTask()
            arrayDailyTasks = CoreDataHandler.getDailyTask()
        }
        for each in arrayDailyTasks {
            dailyTaskCellViewModels.append(DailyTaskCellViewModel(dailyTask: each))
        }
        onRequestEnd?()
    }
    
    func resetDailyTask(onRequestEnd: (() -> Void)?) {
        CoreDataHandler.resetDailyTask()
        onRequestEnd?()
    }
    
}
