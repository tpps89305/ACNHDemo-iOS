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
    
}
