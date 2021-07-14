//
//  VillagersTableViewCell.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/6/30.
//

import Foundation
import UIKit

class VillagersCell: UITableViewCell {
    
    @IBOutlet weak var imageVillager: UIImageView!
    @IBOutlet weak var labelVillager: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageVillager.image = nil
    }
    
    func setup(viewModel: VillagerCellViewModel) {
        let villager = viewModel.villager
        let nameTW = villager.name.nameTWzh
        let iconUri = villager.iconURI
        self.labelVillager.text = nameTW
        self.imageVillager.loadUrl(url: iconUri, cell: self)
    }
    
}
