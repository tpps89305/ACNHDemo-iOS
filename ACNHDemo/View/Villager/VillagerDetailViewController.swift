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
    @IBOutlet weak var tableDetail: UITableView!
    var arrayDetailTitle: [String] = []
    var arrayDetailContent: [String] = []
    let viewModel = VillagerDetailVCViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
        bindViewModel()
        viewModel.parseVillagerDetail(villager: villager!)
        
        tableDetail.register(UINib(nibName: "VillagerDetailAvatarCell", bundle: nil), forCellReuseIdentifier: "AvatarCell")
        tableDetail.register(UINib(nibName: "VillagerDetailContentCell", bundle: nil), forCellReuseIdentifier: "DetailCell")
        
        tableDetail.backgroundColor = hexStringToUIColor(hex: villager?.bubbleColor ?? "")
    }

    func initViews() {
        navigationController?.navigationBar.prefersLargeTitles = true
        let name = villager?.name.nameTWzh
        title = name
        print("VillagerDetail: villager's name = " + name!)
    }

    func bindViewModel() {
        viewModel.onRequestEnd = { [self] in
            tableDetail.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case VillagerDetailCellType.Avatar.rawValue:
            return 1
        case VillagerDetailCellType.Content.rawValue:
            return viewModel.villagerDetailCellViewModels.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case VillagerDetailCellType.Avatar.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AvatarCell", for: indexPath) as! VillagerDetailAvatarCell
            cell.setup(viewModel: viewModel.villagerAvatarCellViewModel)
            return cell
            
        case VillagerDetailCellType.Content.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! VillagerDetailContentCell
            cell.setup(viewModel: viewModel.villagerDetailCellViewModels[indexPath.row])
            return cell

        default:
            return UITableViewCell()
        }
    }

}
