//
//  DailyTaskDetailCell.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/10/18.
//

import UIKit

class DailyTaskDetailCell: UITableViewCell {

    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var labelProgressMax: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(dailyTask: DailyTask) {
        imageIcon.image = UIImage(named: dailyTask.iconName ?? "")
        labelTitle.text = dailyTask.name
        progressView.progress = Float(dailyTask.currentValue / dailyTask.maxValue)
        labelProgressMax.text = String(Int(dailyTask.maxValue))
    }
    
}
