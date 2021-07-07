//
//  VillagerDetailViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/7.
//

import UIKit

enum VillagerDetailCellType: Int {
    case Avatar = 0, Content
}

class VillagerDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var villager: Villager?
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var tableDetail: UITableView!
    var arrayDetailTitle: [String] = []
    var arrayDetailContent: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let name = villager?.name.nameTWzh
        labelName.text = name
        print("VillagerDetail: villager's name = " + name!)
        
        arrayDetailTitle.append("Personality")
        arrayDetailTitle.append("Birthday")
        arrayDetailTitle.append("Like")
        arrayDetailTitle.append("Species")
        arrayDetailTitle.append("Gender")
        arrayDetailTitle.append("Catch phrase")
        
        arrayDetailContent.append(villager?.personality.rawValue ?? "")
        arrayDetailContent.append(villager?.birthday ?? "")
        arrayDetailContent.append(villager?.birthday ?? "")
        arrayDetailContent.append(villager?.species ?? "")
        arrayDetailContent.append(villager?.gender.rawValue ?? "")
        arrayDetailContent.append(villager?.catchPhrase ?? "")
        
        tableDetail.register(UINib(nibName: "VillagerDetailAvatarCell", bundle: nil), forCellReuseIdentifier: "AvatarCell")
        tableDetail.register(UINib(nibName: "VillagerDetailContentCell", bundle: nil), forCellReuseIdentifier: "DetailCell")
        
        tableDetail.backgroundColor = hexStringToUIColor(hex: villager?.bubbleColor ?? "")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case VillagerDetailCellType.Avatar.rawValue:
            return 1
        case VillagerDetailCellType.Content.rawValue:
            return 6
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case VillagerDetailCellType.Avatar.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AvatarCell", for: indexPath) as! VillagerDetailAvatarCell
            cell.imageAvatar.loadUrl(url: villager?.imageURI ?? "")
            return cell
            
        case VillagerDetailCellType.Content.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! VillagerDetailContentCell
            cell.labelDetailTitle.text = arrayDetailTitle[indexPath.row]
            cell.labelDetailContent.text = arrayDetailContent[indexPath.row]
            cell.labelDetailTitle.textColor = hexStringToUIColor(hex: villager?.textColor ?? "")
            return cell
        default:
            return UITableViewCell()
        }
    }

}
