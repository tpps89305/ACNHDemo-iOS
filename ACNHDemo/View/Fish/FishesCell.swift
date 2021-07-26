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
        imageAvatar.loadUrl(url: fish.iconURI, onLoadingCompleted: {() in
            self.setNeedsLayout()
            self.viewLoading.stopAnimating()
        } )
        labelName.text = fish.name.nameTWzh
        let salesInfo = "Sell price: \(fish.price), Sell price CJ: \(fish.priceCj)"
        labelPriceInfo.text = salesInfo
    }
    
    func setup(viewModel: SeaCreatureCellViewModel) {
        let seaCreature = viewModel.seaCreature
        imageAvatar.loadUrl(url: seaCreature.iconURI, onLoadingCompleted: {() in
            self.setNeedsLayout()
            self.viewLoading.stopAnimating()
        } )
        labelName.text = seaCreature.name.nameTWzh
        let salesInfo = "Sell price: \(seaCreature.price)"
        labelPriceInfo.text = salesInfo
    }
    
    func setup(viewModel: BugCellViewModel) {
        let bug = viewModel.bug
        imageAvatar.loadUrl(url: bug.iconURI, onLoadingCompleted: {() in
            self.setNeedsLayout()
            self.viewLoading.stopAnimating()
        } )
        labelName.text = bug.name.nameTWzh
        let salesInfo = "Sell price: \(bug.price), sell Flick price: \(bug.priceFlick)"
        labelPriceInfo.text = salesInfo
    }
    
    func setup(viewModel: FossilCellViewModel) {
        let fossil = viewModel.fossil
        imageAvatar.loadUrl(url: fossil.imageURI, onLoadingCompleted: {() in
            self.setNeedsLayout()
            self.viewLoading.stopAnimating()
        } )
        labelName.text = fossil.name.nameTWzh
        let salesInfo = "Sell price: \(fossil.price)"
        labelPriceInfo.text = salesInfo
    }
    
    func setup(viewModel: HousewareCellViewModel) {
        let houseware = viewModel.houseware
        imageAvatar.loadUrl(url: houseware.imageURI) {
            self.setNeedsLayout()
            self.viewLoading.stopAnimating()
        }
        labelName.text = houseware.name.nameTWzh
        var salesInfo = ""
        if houseware.buyPrice != nil {
            salesInfo += "Bug price: \(houseware.buyPrice ?? 0), "
        }
        salesInfo += "Sell Price: \(houseware.sellPrice)"
        labelPriceInfo.text = salesInfo
    }
    
}
