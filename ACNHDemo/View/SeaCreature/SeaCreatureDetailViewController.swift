//
//  SeaCreatureDetailViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/15.
//

import UIKit

class SeaCreatureDetailViewController: UIViewController {
    
    @IBOutlet weak var imageSeaCreature: UIImageView!
    @IBOutlet weak var labelSpeed: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var viewLoading: UIActivityIndicatorView!
    @IBOutlet weak var availableMonthView: AvailableMonthView!

    var seaCreature: SeaCreature?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewLoading.startAnimating()
        title = seaCreature!.name.nameTWzh
        imageSeaCreature.loadUrl(url: seaCreature!.imageURI, onLoadingCompleted: {() in
            self.viewLoading.stopAnimating()
        })
        labelSpeed.text = seaCreature?.speed.rawValue
        labelPrice.text = String(seaCreature!.price)
        availableMonthView.availableMonth = seaCreature!.availability.monthArrayNorthern
    }

}
