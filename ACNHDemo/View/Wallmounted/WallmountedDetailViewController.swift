//
//  WallmountedDetailViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/8/9.
//

import UIKit

class WallmountedDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var imageAvatar: UIImageView!
    @IBOutlet weak var tableDetail: UITableView!
    
    var wallmounted: Wallmounted?
    var arrayDetails: [Dictionary<String, String>] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = wallmounted!.name.nameTWzh
        navigationController?.navigationBar.prefersLargeTitles = true
        tableDetail.register(UINib(nibName: "VillagerDetailContentCell", bundle: nil), forCellReuseIdentifier: "DetailCell")
        initValues()
        imageAvatar.loadUrl(url: wallmounted!.imageURI) {

        }
    }

    func initValues() {
        var dict = ["title": "Size", "content": wallmounted!.size.rawValue]
        arrayDetails.append(dict)
        dict = ["title": "Tag", "content": wallmounted!.tag]
        arrayDetails.append(dict)
        if wallmounted!.buyPrice != nil {
            dict = ["title": "Buy price", "content": String(wallmounted!.buyPrice!)]
            arrayDetails.append(dict)
        }
        dict = ["title": "Sell price", "content": String(wallmounted!.sellPrice)]
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
