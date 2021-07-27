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
    @IBOutlet weak var viewLoading: UIActivityIndicatorView!
    @IBOutlet weak var tagsListView: TagsListView!
    
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
        if tagsListView.tags.isEmpty {
            tagsListView.tags = ["Sell: \(fish.price)", "Sell price CJ: \(fish.priceCj)"]
        }
    }
    
    func setup(viewModel: SeaCreatureCellViewModel) {
        let seaCreature = viewModel.seaCreature
        imageAvatar.loadUrl(url: seaCreature.iconURI, onLoadingCompleted: {() in
            self.setNeedsLayout()
            self.viewLoading.stopAnimating()
        } )
        labelName.text = seaCreature.name.nameTWzh
        if tagsListView.tags.isEmpty {
            tagsListView.tags = ["Sell: \(seaCreature.price)"]
        }
    }
    
    func setup(viewModel: BugCellViewModel) {
        let bug = viewModel.bug
        imageAvatar.loadUrl(url: bug.iconURI, onLoadingCompleted: {() in
            self.setNeedsLayout()
            self.viewLoading.stopAnimating()
        } )
        labelName.text = bug.name.nameTWzh
        if tagsListView.tags.isEmpty {
            tagsListView.tags = ["Sell: \(bug.price)", "Sell Flick: \(bug.priceFlick)"]
        }
    }
    
    func setup(viewModel: FossilCellViewModel) {
        let fossil = viewModel.fossil
        imageAvatar.loadUrl(url: fossil.imageURI, onLoadingCompleted: {() in
            self.setNeedsLayout()
            self.viewLoading.stopAnimating()
        } )
        labelName.text = fossil.name.nameTWzh
        if tagsListView.tags.isEmpty {
            tagsListView.tags = ["Sell: \(fossil.price)"]
        }
    }
    
    func setup(viewModel: HousewareCellViewModel) {
        let houseware = viewModel.houseware
        imageAvatar.loadUrl(url: houseware.imageURI) {
            self.setNeedsLayout()
            self.viewLoading.stopAnimating()
        }
        labelName.text = houseware.name.nameTWzh
        var salesInfo: [String] = []
        if houseware.buyPrice != nil {
            salesInfo.append("Buy: \(houseware.buyPrice ?? 0)")
        }
        salesInfo.append("Sell: \(houseware.sellPrice)")
        if tagsListView.tags.isEmpty {
            tagsListView.tags = salesInfo            
        }
    }
    
}
