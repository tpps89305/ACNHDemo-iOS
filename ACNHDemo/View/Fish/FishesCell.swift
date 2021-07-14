//
//  FishesCell.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/13.
//

import UIKit

class FishesCell: UITableViewCell {

    @IBOutlet weak var imageAvatar: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelPriceInfo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageAvatar.image = nil
    }
    
    func setup(viewModel: FishCellViewModel) {
        let fish = viewModel.fish
        self.imageAvatar.loadUrl(url: fish.iconURI, cell: self)
        self.labelName.text = fish.name.nameTWzh
        let salsInfo = "Sell price: \(fish.price), Sell price CJ: \(fish.priceCj)"
        self.labelPriceInfo.text = salsInfo
    }
    
}
