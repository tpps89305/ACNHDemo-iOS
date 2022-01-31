//
//  DailyTaskDetailViewModel.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/10/27.
//

import UIKit

class DailyTaskDetailViewModel: NSObject {
    
    var dailyTaskCellViewModels: [DailyTaskCellViewModel] = []
    
    func getDailyTasks(onRequestEnd: (() -> Void)?) {
        var arrayDailyTasks = CoreDataHandler.getAllDailyTask()
        if arrayDailyTasks.isEmpty {
            CoreDataHandler.initDailyTask()
            arrayDailyTasks = CoreDataHandler.getAllDailyTask()
        }
        dailyTaskCellViewModels.removeAll()
        for each in arrayDailyTasks {
            dailyTaskCellViewModels.append(DailyTaskCellViewModel(dailyTask: each))
        }
        onRequestEnd?()
    }
    
}
