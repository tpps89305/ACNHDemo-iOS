//
//  VillagerDetailContentCell.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/7.
//

import UIKit

class VillagerDetailContentCell: UITableViewCell {
    
    @IBOutlet weak var labelDetailTitle: UILabel!
    @IBOutlet weak var labelDetailContent: UILabel!
    
    func setup(viewModel: VillagerDetailCellViewModel) {
        labelDetailTitle.text = viewModel.titleContentPair.title
        labelDetailContent.text = viewModel.titleContentPair.content
        labelDetailTitle.textColor = hexStringToUIColor(hex: viewModel.textColor)
    }
    
}
