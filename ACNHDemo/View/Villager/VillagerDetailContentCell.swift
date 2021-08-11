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
        
        // Skip set text color if not setting the value
        if viewModel.textColor != nil {
            labelDetailTitle.textColor = UIColor(hexString: viewModel.textColor!)
        }
        
        // Skip set text color if not setting the value
        if viewModel.textColor != nil {
            labelDetailContent.textColor = UIColor(hexString: viewModel.bubbleColor!).inverted()
        }
    }
    
}
