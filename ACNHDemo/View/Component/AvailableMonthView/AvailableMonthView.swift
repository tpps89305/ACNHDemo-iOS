//
//  AvailableMonthView.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/26.
//

import UIKit
import DynamicColor

class AvailableMonthView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, NibOwnerLoadable {
    
    @IBOutlet weak var collectionMonth: UICollectionView!

    private var monthOfToday = -1
    
    var availableMonth: [Int] = [] {
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
        collectionMonth.register(R.nib.availableMonthCell)
        monthOfToday = DateHandler.getCurrentMonth()
        print("Month of today is \(monthOfToday)")
    }

    private func customInit() {
        loadNibContent()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayMonth.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.availableMonthCell, for: indexPath) else {
            fatalError("Cannot dequeue AvailableMonthCell!")
        }
        cell.labelMonth.text = arrayMonth[indexPath.row]
        if availableMonth.contains(indexPath.row + 1) {
            cell.viewMonth.backgroundColor = R.color.tagBackground2()?.darkened()
            cell.labelMonth.textColor = R.color.tagTextColor()
        }
        if indexPath.row == monthOfToday - 1 {
            cell.viewMonthBorder.backgroundColor = UIColor.systemPink
        }
        return cell
    }

}
