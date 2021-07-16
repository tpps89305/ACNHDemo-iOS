//
//  ArtCell.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/16.
//

import UIKit

class ArtCell: UITableViewCell {

    @IBOutlet weak var imageAvatar: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelPriceInfo: UILabel!
    @IBOutlet weak var labelFakeInfo: UILabel!
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
    
    func setup(viewModel: ArtCellViewModel) {
        let artValue = viewModel.artValue
        self.imageAvatar.loadUrl(url: artValue.imageURI, onLoadingCompleted: {() in
            self.setNeedsLayout()
            self.viewLoading.stopAnimating()
        } )
        self.labelName.text = artValue.name.nameTWzh
        let salsInfo = "Buy price: \(artValue.buyPrice), Sell Price: \(artValue.sellPrice)"
        self.labelPriceInfo.text = salsInfo
        self.labelFakeInfo.isHidden = !artValue.hasFake
    }
    
}
