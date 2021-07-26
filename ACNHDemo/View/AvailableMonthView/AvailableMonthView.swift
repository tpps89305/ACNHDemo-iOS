//
//  AvailableMonthView.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/26.
//

import UIKit

@IBDesignable
class AvailableMonthView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, NibOwnerLoadable {
    
    @IBOutlet weak var collectionMonth: UICollectionView!
    
    @IBInspectable var availableMonth: [Int] = [] {
        didSet {
            collectionMonth.reloadData()
        }
    }

    var arrayMonth = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]

    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    override class func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }

    override func awakeFromNib() {
        collectionMonth.register(UINib(nibName: "AvailableMonthCell", bundle: nil), forCellWithReuseIdentifier: "MonthCell")
    }

    private func customInit() {
        loadNibContent()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayMonth.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //255 243 173
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MonthCell", for: indexPath) as! AvailableMonthCell
        cell.labelMonth.text = arrayMonth[indexPath.row]
        if (availableMonth.contains(indexPath.row + 1)) {
            cell.viewMonth.backgroundColor = UIColor.init(red: 0.941, green: 0.839, blue: 0.258, alpha: 1) // 240 214 66
            cell.labelMonth.textColor = UIColor.init(red: 0.294, green: 0.294, blue: 0.294, alpha: 1) // 75 75 75
        }
        return cell
    }

}
