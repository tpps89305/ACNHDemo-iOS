//
//  VillagerDetailAvatarCell.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/7.
//

import UIKit

class VillagerDetailAvatarCell: UITableViewCell {

    @IBOutlet weak var imageAvatar: UIImageView!
    @IBOutlet weak var viewLoading: UIActivityIndicatorView!

    func setup(viewModel: VillagerAvatarCellViewModel) {
        imageAvatar.loadUrl(url: viewModel.imageUri, onLoadingCompleted: {() in
            self.viewLoading.stopAnimating()
        })
    }
    
}
