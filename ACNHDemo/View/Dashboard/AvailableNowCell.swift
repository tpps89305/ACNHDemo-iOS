//
//  AvailableNowCell.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/9/21.
//

import UIKit

class AvailableNowCell: UICollectionViewCell {

    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var labelAmount: UILabel!
    @IBOutlet weak var labelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(viewModel: AvailableNowCellViewModel) {
        imageIcon.image = viewModel.availableNowInfo.icon
        labelName.text = viewModel.availableNowInfo.name
        labelAmount.text = String(viewModel.availableNowInfo.amount)
    }

}
