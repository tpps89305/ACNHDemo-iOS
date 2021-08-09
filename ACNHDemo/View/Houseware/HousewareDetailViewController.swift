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

        tableDetail.register(UINib(nibName: "VillagerDetailContentCell", bundle: nil), forCellReuseIdentifier: "DetailCell")
        imageAvatar.loadUrl(url: houseware!.imageURI) {

        }

        viewModel.parseHousewaresDetail(houseware: houseware!)
    }

    func initViews() {
        title = houseware!.name.nameTWzh
        navigationController?.navigationBar.prefersLargeTitles = true
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! VillagerDetailContentCell
        cell.setup(viewModel: viewModel.villagerDetailCellViewModels[indexPath.row])
        return cell
    }

}
