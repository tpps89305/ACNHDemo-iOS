//
//  WallmountedDetailViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/8/9.
//

import UIKit

class WallmountedDetailViewController: UIViewController {

    @IBOutlet weak var imageAvatar: UIImageView!
    @IBOutlet weak var tableDetail: UITableView!
    @IBOutlet weak var viewLoading: UIActivityIndicatorView!
    
    var wallmounted: Wallmounted?
    private let viewModel = WallmountedDetailVCViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
        bindViewModel()

        viewLoading.startAnimating()
        imageAvatar.loadUrl(url: wallmounted!.imageURI) {
            self.viewLoading.stopAnimating()
        }
        viewModel.parseWallmountedDetail(wallmounted: wallmounted!)
    }

    private func initViews() {
        title = wallmounted!.name.nameTWzh
        navigationController?.navigationBar.prefersLargeTitles = true
        tableDetail.register(R.nib.commonDetailContentCell)
    }

    private func bindViewModel() {
        viewModel.onRequestEnd = { [self] in
            tableDetail.reloadData()
        }
    }

}

extension WallmountedDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
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
