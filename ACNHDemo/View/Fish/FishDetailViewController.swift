//
//  FishDetailViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/14.
//

import UIKit

class FishDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var imageFish: UIImageView!
    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var labelPriceInfo: UILabel!
    @IBOutlet weak var collectionMonth: UICollectionView!
    
    var arrayMonth = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "July", "Aug", "Sep", "Oct", "Nov", "Dec"]
    
    var fish: Fish?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = fish!.name.nameTWzh
        imageFish.loadUrl(url: fish!.imageURI)
        labelLocation.text = fish!.availability.location.rawValue
        let priceInfo = "Sell price: \(fish!.price), Sell to CJ price: \(fish!.priceCj)"
        labelPriceInfo.text = priceInfo
        
        self.collectionMonth.register(UINib(nibName: "AvailableMonthCell", bundle: nil), forCellWithReuseIdentifier: "MonthCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayMonth.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //255 243 173
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MonthCell", for: indexPath) as! AvailableMonthCell
        cell.labelMonth.text = arrayMonth[indexPath.row]
        if (fish?.availability.monthArrayNorthern.contains(indexPath.row + 1))! {
            cell.viewMonth.backgroundColor = UIColor.init(red: 0.941, green: 0.839, blue: 0.258, alpha: 1) // 240 214 66
        }
        return cell
    }

}
