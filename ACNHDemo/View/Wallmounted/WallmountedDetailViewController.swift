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
    let viewModel = WallmountedDetailVCViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
        bindViewModel()

        // Do any additional setup after loading the view.
        imageAvatar.loadUrl(url: wallmounted!.imageURI) {
            // Do nothing
        }
        viewModel.parseWallmountedDetail(wallmounted: wallmounted!)
    }

    private func initViews() {
        title = wallmounted!.name.nameTWzh
        navigationController?.navigationBar.prefersLargeTitles = true
        tableDetail.register(UINib(nibName: "VillagerDetailContentCell", bundle: nil), forCellReuseIdentifier: "DetailCell")
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
