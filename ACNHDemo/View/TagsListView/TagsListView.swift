//
//  TagsListView.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/26.
//

import UIKit

class TagsListView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, NibOwnerLoadable {

    @IBOutlet weak var collectionTags: UICollectionView!

    // FIXME: Fix issue of cannot show only one cell
    var tags: [String] = [] {
        didSet {
            collectionTags.reloadData()
        }
    }

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
        collectionTags.register(UINib(nibName: "TagsListViewCell", bundle: nil), forCellWithReuseIdentifier: "TagsListViewCell")
    }

    private func customInit() {
        loadNibContent()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tags.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagsListViewCell", for: indexPath) as! TagsListViewCell
        cell.labelTag.text = tags[indexPath.row]
        if tags[indexPath.row] == "" {
            cell.viewTag.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0)
        }
        return cell
    }

}
