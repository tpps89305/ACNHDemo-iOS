//
//  VillagerDetailContentCell.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/7.
//

import UIKit
import DynamicColor

class VillagerDetailContentCell: UITableViewCell {
    
    @IBOutlet weak var labelDetailTitle: UILabel!
    @IBOutlet weak var labelDetailContent: UILabel!
    
    func setup(viewModel: VillagerDetailCellViewModel) {
        labelDetailTitle.text = viewModel.titleContentPair.title
        labelDetailContent.text = viewModel.titleContentPair.content
        labelDetailTitle.textColor = UIColor(hexString: viewModel.textColor ?? "")
        labelDetailContent.textColor = UIColor(hexString: viewModel.bubbleColor ?? "").inverted()
    }
    
}
