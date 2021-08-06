//
//  BugDetailViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/15.
//

import UIKit

class BugDetailViewController: UIViewController {

    @IBOutlet weak var imageBug: UIImageView!
    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var labelPriceInfo: UILabel!
    @IBOutlet weak var viewLoading: UIActivityIndicatorView!
    @IBOutlet weak var availableMonthView: AvailableMonthView!
    @IBOutlet weak var timeScaleView: TimeScaleView!
    
    var bug: Bug?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewLoading.startAnimating()
        title = bug!.name.nameTWzh
        imageBug.loadUrl(url: bug!.imageURI, onLoadingCompleted: {() in
            self.viewLoading.stopAnimating()
        })
        labelLocation.text = bug?.availability.location
        let salesInfo = "Sell price: \(bug!.price), sell Flick price: \(bug!.priceFlick)"
        labelPriceInfo.text = salesInfo
        availableMonthView.availableMonth = bug!.availability.monthArrayNorthern
        timeScaleView.drawTimeScale(arrayTime: bug!.availability.timeArray)
    }

}
