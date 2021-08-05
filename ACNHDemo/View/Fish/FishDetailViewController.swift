//
//  FishDetailViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/14.
//

import UIKit

class FishDetailViewController: UIViewController {
    
    @IBOutlet weak var imageFish: UIImageView!
    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var labelPriceInfo: UILabel!
    @IBOutlet weak var viewLoading: UIActivityIndicatorView!
    @IBOutlet weak var availableMonthView: AvailableMonthView!
    @IBOutlet weak var timeScaleView: TimeScaleView!
    
    var fish: Fish?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewLoading.startAnimating()

        // Do any additional setup after loading the view.
        title = fish!.name.nameTWzh
        imageFish.loadUrl(url: fish!.imageURI, onLoadingCompleted: {() in
            self.viewLoading.stopAnimating()
        })
        labelLocation.text = fish!.availability.location.rawValue
        let priceInfo = "Sell price: \(fish!.price), Sell to CJ price: \(fish!.priceCj)"
        labelPriceInfo.text = priceInfo
        availableMonthView.availableMonth = fish!.availability.monthArrayNorthern
        timeScaleView.drawTimeScale(time: fish!.availability.time)
    }

}
