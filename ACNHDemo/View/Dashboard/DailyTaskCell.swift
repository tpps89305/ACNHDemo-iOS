//
//  DailyTaskCell.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/9/20.
//

import UIKit

class DailyTaskCell: UICollectionViewCell {
    
    @IBOutlet weak var dailyButton: DailyTaskProgressButton!
    
    override func awakeFromNib() {
        
    }
    
    func setup(viewModel: DailyTaskCellViewModel) {
        let dailyTask = viewModel.dailyTask
        dailyButton.iconTask = UIImage.init(named: dailyTask.iconName ?? "")
        dailyButton.maxValue = Double(dailyTask.maxValue)
        dailyButton.currentValue = Double(dailyTask.currentValue)
        dailyButton.onProgressPlus = { currentValue in
            dailyTask.currentValue = Int32.init(currentValue)
            CoreDataHandler.updateDailyTask(dailyTask: dailyTask)
        }
    }
}
