//
//  TagsListView.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/26.
//

import UIKit

class TagsListView: UIView, NibOwnerLoadable {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackTags: UIStackView!
    @IBOutlet weak var emptyView: UIView!
    
    var tags: [String] = [] {
        didSet {
            update()
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
        super.awakeFromNib()
    }

    private func customInit() {
        loadNibContent()
    }
    
    func resetScrollOffset() {
        scrollView.setContentOffset(CGPoint.zero, animated: false)
    }
    
    func update() {
        stackTags.removeArrangedSubview(emptyView)
        for tag in tags {
            if let tagView = Bundle(for: TagsListTag.self).loadNibNamed("\(TagsListTag.self)", owner: nil, options: nil)?.first as? TagsListTag {
                tagView.labelTag.text = tag
                stackTags.addArrangedSubview(tagView)
            }
        }
    }

}
