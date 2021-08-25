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
    let viewModel = HousewareDetailVCViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
        bindViewModel()

        imageAvatar.loadUrl(url: houseware!.imageURI) {
            // Do nothing
        }
        viewModel.parseHousewaresDetail(houseware: houseware!)
    }

    func initViews() {
        title = houseware!.name.nameTWzh
        navigationController?.navigationBar.prefersLargeTitles = true
        tableDetail.register(UINib(nibName: String(describing: VillagerDetailContentCell.self), bundle: nil), forCellReuseIdentifier: Constant.CellID.VILLAGER_CONTENT_CELL)
    }

    private func bindViewModel() {
        viewModel.onRequestEnd = { [self] in
            tableDetail.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.villagerDetailCellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.CellID.VILLAGER_CONTENT_CELL, for: indexPath) as! VillagerDetailContentCell
        cell.setup(viewModel: viewModel.villagerDetailCellViewModels[indexPath.row])
        return cell
    }

}
