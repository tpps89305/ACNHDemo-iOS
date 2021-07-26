//
//  HousewareDetailViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/19.
//

import UIKit

class HousewareDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var imageAvatar: UIImageView!
    @IBOutlet weak var tableDetail: UITableView!
    
    var houseware: Houseware?
    var arrayDetails: [Dictionary<String, String>] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = houseware!.name.nameTWzh
        navigationController?.navigationBar.prefersLargeTitles = true
        tableDetail.register(UINib(nibName: "VillagerDetailContentCell", bundle: nil), forCellReuseIdentifier: "DetailCell")
        initValues()
        imageAvatar.loadUrl(url: houseware!.imageURI) {
            
        }
    }
    
    func initValues() {
        var dict = ["title": "Size", "content": houseware!.size.rawValue]
        arrayDetails.append(dict)
        dict = ["title": "Tag", "content": houseware!.tag.rawValue]
        arrayDetails.append(dict)
        if houseware!.buyPrice != nil {
            dict = ["title": "Buy price", "content": String(houseware!.buyPrice!)]
            arrayDetails.append(dict)
        }
        dict = ["title": "Sell price", "content": String(houseware!.sellPrice)]
        arrayDetails.append(dict)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! VillagerDetailContentCell
        cell.labelDetailTitle.text = arrayDetails[indexPath.row]["title"]
        cell.labelDetailContent.text = arrayDetails[indexPath.row]["content"]
        return cell
    }

}
