//
//  SeaCreatureDetailViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/15.
//

import UIKit

class SeaCreatureDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var imageSeaCreature: UIImageView!
    @IBOutlet weak var labelSpeed: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var collectionMonth: UICollectionView!
    @IBOutlet weak var viewLoading: UIActivityIndicatorView!
    
    var arrayMonth = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
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
        
        collectionMonth.register(UINib(nibName: "AvailableMonthCell", bundle: nil), forCellWithReuseIdentifier: "MonthCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayMonth.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //255 243 173
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MonthCell", for: indexPath) as! AvailableMonthCell
        cell.labelMonth.text = arrayMonth[indexPath.row]
        if (seaCreature?.availability.monthArrayNorthern.contains(indexPath.row + 1))! {
            cell.viewMonth.backgroundColor = UIColor.init(red: 0.941, green: 0.839, blue: 0.258, alpha: 1) // 240 214 66
        }
        return cell
    }

}
