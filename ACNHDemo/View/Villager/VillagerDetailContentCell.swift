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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}