//
//  BugDetailViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/15.
//

import UIKit

class BugDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var imageBug: UIImageView!
    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var labelPriceInfo: UILabel!
    @IBOutlet weak var collectionMonth: UICollectionView!
    @IBOutlet weak var viewLoading: UIActivityIndicatorView!
    
    var arrayMonth = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
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
        
        collectionMonth.register(UINib(nibName: "AvailableMonthCell", bundle: nil), forCellWithReuseIdentifier: "MonthCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayMonth.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //255 243 173
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MonthCell", for: indexPath) as! AvailableMonthCell
        cell.labelMonth.text = arrayMonth[indexPath.row]
        if bug!.availability.monthArrayNorthern.contains(indexPath.row + 1) {
            cell.viewMonth.backgroundColor = UIColor.init(red: 0.941, green: 0.839, blue: 0.258, alpha: 1) // 240 214 66
        }
        return cell
    }

}
