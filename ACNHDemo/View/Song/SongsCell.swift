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
    @IBOutlet weak var tagsListView: TagsListView!
    @IBOutlet weak var viewLoading: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewLoading.startAnimating()
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
    
    func setup(viewModel: SongCellViewModel) {
        let song = viewModel.song
        imageAvatar.loadUrl(url: song.imageURI, onLoadingCompleted: {() in
            self.viewLoading.stopAnimating()
            self.setNeedsLayout()
        })
        labelName.text = song.name.nameTWzh
        var salesInfo: [String] = []
        if song.buyPrice != nil {
            salesInfo.append("Buy: \(song.buyPrice ?? 0)")
        }
        salesInfo.append("Sell: \(song.sellPrice)")
        tagsListView.tags = salesInfo
    }
    
}
