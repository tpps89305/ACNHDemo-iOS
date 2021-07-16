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
    @IBOutlet weak var viewLoading: UIActivityIndicatorView!
    
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
        viewLoading.startAnimating()
    }
    
    func setup(viewModel: FishCellViewModel) {
        let fish = viewModel.fish
        self.imageAvatar.loadUrl(url: fish.iconURI, onLoadingCompleted: {() in
            self.setNeedsLayout()
            self.viewLoading.stopAnimating()
        } )
        self.labelName.text = fish.name.nameTWzh
        let salsInfo = "Sell price: \(fish.price), Sell price CJ: \(fish.priceCj)"
        self.labelPriceInfo.text = salsInfo
    }
    
    func setup(viewModel: SeaCreatureCellViewModel) {
        let seaCreature = viewModel.seaCreature
        self.imageAvatar.loadUrl(url: seaCreature.iconURI, onLoadingCompleted: {() in
            self.setNeedsLayout()
            self.viewLoading.stopAnimating()
        } )
        self.labelName.text = seaCreature.name.nameTWzh
        let salsInfo = "Sell price: \(seaCreature.price)"
        self.labelPriceInfo.text = salsInfo
    }
    
    func setup(viewModel: BugCellViewModel) {
        let bug = viewModel.bug
        self.imageAvatar.loadUrl(url: bug.iconURI, onLoadingCompleted: {() in
            self.setNeedsLayout()
            self.viewLoading.stopAnimating()
        } )
        self.labelName.text = bug.name.nameTWzh
        let salsInfo = "Sell price: \(bug.price), sell Flick price: \(bug.priceFlick)"
        self.labelPriceInfo.text = salsInfo
    }
    
    func setup(viewModel: FossilCellViewModel) {
        let fossil = viewModel.fossil
        self.imageAvatar.loadUrl(url: fossil.imageURI, onLoadingCompleted: {() in
            self.setNeedsLayout()
            self.viewLoading.stopAnimating()
        } )
        self.labelName.text = fossil.name.nameTWzh
        let salsInfo = "Sell price: \(fossil.price)"
        self.labelPriceInfo.text = salsInfo
    }
    
}
