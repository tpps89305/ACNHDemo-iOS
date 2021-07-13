//
//  SongsCell.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/8.
//

import UIKit

class SongsCell: UITableViewCell {

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
    
    func setup(viewModel: SongCellViewModel) {
        let song = viewModel.song
        self.imageAvatar.loadUrl(url: song.imageURI, cell: self)
        self.labelName.text = song.name.nameTWzh
        let salsInfo = "Buy price: \(song.buyPrice ?? 0), Sell price: \(song.sellPrice)"
        self.labelPriceInfo.text = salsInfo
    }
    
}
