//
//  VillagerDetailViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/7.
//

import UIKit

enum VillagerDetailCellType: Int, CaseIterable {
    case avatar = 0, content
}

class VillagerDetailViewController: UIViewController {

    @IBOutlet weak var tableDetail: UITableView!

    var villager: Villager?
    private let viewModel = VillagerDetailVCViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
        bindViewModel()
        viewModel.parseVillagerDetail(villager: villager!)
        tableDetail.register(R.nib.villagerDetailAvatarCell)
        tableDetail.register(R.nib.commonDetailContentCell)
        tableDetail.backgroundColor = UIColor(hexString: villager?.bubbleColor ?? "")
    }

    private func initViews() {
        navigationController?.navigationBar.prefersLargeTitles = true
        let name = villager?.name.nameTWzh
        title = name
        print("VillagerDetail: villager's name = " + name!)
    }

    private func bindViewModel() {
        viewModel.onRequestEnd = { [self] in
            tableDetail.reloadData()
        }
    }

}

extension VillagerDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        VillagerDetailCellType.allCases.count
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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.villagerDetailAvatarCell, for: indexPath) else {
                fatalError("Cannot dequeue VillagerDetailAvatarCell!")
            }
            cell.setup(viewModel: viewModel.villagerAvatarCellViewModel)
            return cell
            
        case VillagerDetailCellType.content.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.commonDetailContentCell, for: indexPath) else {
                fatalError("Cannot dequeue VillagerDetailContentCell!")
            }
            cell.setup(viewModel: viewModel.villagerDetailCellViewModels[indexPath.row])
            return cell

        default:
            return UITableViewCell()
        }
    }
    
}
