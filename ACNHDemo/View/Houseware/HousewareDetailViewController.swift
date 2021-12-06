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
    @IBOutlet weak var viewLoading: UIActivityIndicatorView!
    
    var houseware: Houseware?
    let viewModel = HousewareDetailVCViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
        bindViewModel()
        
        viewLoading.startAnimating()
        imageAvatar.loadUrl(url: houseware!.imageURI) {
            self.viewLoading.stopAnimating()
        }
        viewModel.parseHousewaresDetail(houseware: houseware!)
    }

    func initViews() {
        title = houseware!.name.nameTWzh
        navigationController?.navigationBar.prefersLargeTitles = true
        tableDetail.register(R.nib.commonDetailContentCell)
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.commonDetailContentCell, for: indexPath) else {
            fatalError("Cannot dequeue CommonDetailContentCell!")
        }
        cell.setup(viewModel: viewModel.villagerDetailCellViewModels[indexPath.row])
        return cell
    }

}
