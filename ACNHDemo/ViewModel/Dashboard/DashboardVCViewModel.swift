//
// Created by 楊朝富 on 2021/8/10.
//

import Foundation
import UIKit
import CoreData

class DashboardVCViewModel {

    var arrayWeekday = ["日", "一", "二", "三", "四", "五", "六"]
    var dailyTaskCellViewModels: [DailyTaskCellViewModel] = []
    var dailyBirthdayCellViewModels: [DailyBirthdayCellViewModel] = []
    var availableNowCellViewModels: [AvailableNowCellViewModel] = []

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
        let currentMonth = DateHandler.getCurrentMonth()
        let currentHour = DateHandler.getCurrentHour()
        var arrayFishes = Array<Fish>()
        
        ACNHProvider.request(.fishes(fishId: 0)) { result in
            do {
                let response = try result.get()
                let fishes = try ACNHJSONDecoder().decode(Fishes.self, from: response.data)
                for eachKey in fishes.keys {
                    arrayFishes.append(fishes[eachKey]!)
                }
                arrayFishes = arrayFishes.filter { fish -> Bool in
                    if fish.availability.monthArrayNorthern.contains(currentMonth) || fish.availability.isAllYear {
                        if fish.availability.timeArray.contains(currentHour) || fish.availability.isAllDay {
                            return true
                        }
                    }
                    return false
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
        let currentMonth = DateHandler.getCurrentMonth()
        let currentHour = DateHandler.getCurrentHour()
        var arraySeaCreatures = Array<SeaCreature>()
        
        ACNHProvider.request(.seaCreatures(seaCreatureId: 0)) { result in
            do {
                let response = try result.get()
                let seaCreatures = try ACNHJSONDecoder().decode(SeaCreatures.self, from: response.data)
                for eachKey in seaCreatures.keys {
                    arraySeaCreatures.append(seaCreatures[eachKey]!)
                }
                arraySeaCreatures = arraySeaCreatures.filter { seaCreature -> Bool in
                    if seaCreature.availability.monthArrayNorthern.contains(currentMonth) || seaCreature.availability.isAllYear {
                        if seaCreature.availability.timeArray.contains(currentHour) || seaCreature.availability.isAllDay {
                            return true
                        }
                    }
                    return false
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
        let currentMonth = DateHandler.getCurrentMonth()
        let currentHour = DateHandler.getCurrentHour()
        var arrayBugs = Array<Bug>()
        
        ACNHProvider.request(.bugs(bugId: 0)) { result in
            do {
                let response = try result.get()
                let bugs = try ACNHJSONDecoder().decode(Bugs.self, from: response.data)
                for eachKey in bugs.keys {
                    arrayBugs.append(bugs[eachKey]!)
                }
                arrayBugs = arrayBugs.filter { bug -> Bool in
                    if bug.availability.monthArrayNorthern.contains(currentMonth) || bug.availability.isAllYear {
                        if bug.availability.timeArray.contains(currentHour) || bug.availability.isAllDay {
                            return true
                        }
                    }
                    return false
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
    
    func getAvailableNowInfo(onRequestEnd: ((_ indexPaths: [IndexPath]) -> Void)?) {
        availableNowCellViewModels.append(AvailableNowCellViewModel(availableNowInfo: AvailableNowInfo(name: "Fish", amount: 0, iconName: Constant.IconName.FISH)))
        availableNowCellViewModels.append(AvailableNowCellViewModel(availableNowInfo: AvailableNowInfo(name: "Sea Creature", amount: 0, iconName: Constant.IconName.SEA_CREATURE)))
        availableNowCellViewModels.append(AvailableNowCellViewModel(availableNowInfo: AvailableNowInfo(name: "Bug", amount: 0, iconName: Constant.IconName.BUG)))
        
        let indexPath0 = IndexPath(item: 0, section: 0)
        let indexPath1 = IndexPath(item: 1, section: 0)
        let indexPath2 = IndexPath(item: 2, section: 0)
        
        onRequestEnd?([indexPath0, indexPath1, indexPath2])
        
        getAvailableFish { count in
            self.availableNowCellViewModels[0].availableNowInfo.amount = count
            onRequestEnd?([indexPath0])
        }
        getAvailableSeaCreatures { count in
            self.availableNowCellViewModels[1].availableNowInfo.amount = count
            onRequestEnd?([indexPath1])
        }
        getAvailableBugs { count in
            self.availableNowCellViewModels[2].availableNowInfo.amount = count
            onRequestEnd?([indexPath2])
        }
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
    
    func getBirthdayVillager(onRequestEnd: (() -> Void)?) {
        let today = DateHandler.getToday()
        var arrayVillagers = Array<Villager>()
        
        ACNHProvider.request(.villagers(villagerId: 0)) { result in
            do {
                let response = try result.get()
                let villagers = try ACNHJSONDecoder().decode(Villagers.self, from: response.data)
                for eachKey in villagers.keys {
                    arrayVillagers.append(villagers[eachKey]!)
                }
                arrayVillagers = arrayVillagers.filter { each -> Bool in
                    return each.birthday == today
                }
                for each in arrayVillagers {
                    self.dailyBirthdayCellViewModels.append(DailyBirthdayCellViewModel(villager: each))
                }
                
                // Sort to get same order array every time(s).
//                arrayVillagers.sort { (villager0, villager1) -> Bool in
//                    villager0.fileName < villager1.fileName
//                }
//                convertToViewModel(villagers: arrayVillagers)
                onRequestEnd?()
                print("Success to get villagers!")
            } catch {
                print("Error when get villagers...")
            }
        }
    }
    
}
