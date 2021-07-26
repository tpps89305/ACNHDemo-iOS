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
    @IBOutlet weak var viewLoading: UIActivityIndicatorView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageVillager.image = nil
        viewLoading.startAnimating()
    }
    
    func setup(viewModel: VillagerCellViewModel) {
        let villager = viewModel.villager
        let nameTW = villager.name.nameTWzh
        let iconUri = villager.iconURI
        labelVillager.text = nameTW
        imageVillager.loadUrl(url: iconUri, onLoadingCompleted: {() in
            self.viewLoading.stopAnimating()
            self.setNeedsLayout()
        })
    }
    
}
