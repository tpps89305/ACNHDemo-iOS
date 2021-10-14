//
//  CatalogCell.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/8/10.
//

import UIKit

class CatalogCell: UITableViewCell {
    
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
