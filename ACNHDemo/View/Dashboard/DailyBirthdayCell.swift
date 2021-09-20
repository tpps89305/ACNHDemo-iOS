//
//  DailyBirthdayCell.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/9/20.
//

import UIKit

class DailyBirthdayCell: UICollectionViewCell {
    
    @IBOutlet weak var imageVillager: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    
    func setup(viewModel: DailyBirthdayCellViewModel) {
        let villager = viewModel.villager
        imageVillager.loadUrl(url: villager.iconURI) {
            
        }
        labelName.text = villager.name.nameTWzh
    }
}
