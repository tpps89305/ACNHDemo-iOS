//
//  VillagerDetailViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/7.
//

import UIKit

enum VillagerDetailCellType: Int {
    case avatar = 0, content
}

class VillagerDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableDetail: UITableView!

    var villager: Villager?
    let viewModel = VillagerDetailVCViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
        bindViewModel()
        viewModel.parseVillagerDetail(villager: villager!)
        
        tableDetail.register(UINib(nibName: String(describing: VillagerDetailAvatarCell.self), bundle: nil), forCellReuseIdentifier: Constant.CellID.VILLAGER_AVATAR_CELL)
        tableDetail.register(UINib(nibName: String(describing: VillagerDetailContentCell.self), bundle: nil), forCellReuseIdentifier: Constant.CellID.VILLAGER_CONTENT_CELL)

        tableDetail.backgroundColor = UIColor(hexString: villager?.bubbleColor ?? "")
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
        case VillagerDetailCellType.avatar.rawValue:
            return 1
        case VillagerDetailCellType.content.rawValue:
            return viewModel.villagerDetailCellViewModels.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case VillagerDetailCellType.avatar.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.CellID.VILLAGER_AVATAR_CELL, for: indexPath) as? VillagerDetailAvatarCell else {
                fatalError("Cannot dequeue VillagerDetailAvatarCell!")
            }
            cell.setup(viewModel: viewModel.villagerAvatarCellViewModel)
            return cell
            
        case VillagerDetailCellType.content.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.CellID.VILLAGER_CONTENT_CELL, for: indexPath) as? VillagerDetailContentCell else {
                fatalError("Cannot dequeue VillagerDetailContentCell!")
            }
            cell.setup(viewModel: viewModel.villagerDetailCellViewModels[indexPath.row])
            return cell

        default:
            return UITableViewCell()
        }
    }

}
