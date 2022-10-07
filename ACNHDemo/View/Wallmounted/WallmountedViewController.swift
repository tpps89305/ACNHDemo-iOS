//
//  WallmountedViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/8/9.
//

import UIKit

class WallmountedViewController: BaseTableViewController {

    private let viewModel = WallmountedVCViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        bindViewModel()
        viewModel.getWallmounted()
        tableView.register(R.nib.commonCell)
    }

    private func bindViewModel() {
        viewModel.onRequestEnd = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let typedInfo = R.segue.wallmountedViewController.gotoWallmountedDetail(segue: segue),
            let row = sender as? Int {
            typedInfo.destination.wallmounted = viewModel.wallmountedCellViewModels[row].wallmounted
        }
    }

}

// MARK: - UITableView Delegate and DataSources

extension WallmountedViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.wallmountedCellViewModels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.commonCell, for: indexPath) else {
            fatalError("Cannot dequeue CommonCell!")
        }
        let listCellViewModel = viewModel.wallmountedCellViewModels[indexPath.row]
        cell.setup(viewModel: listCellViewModel)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: R.segue.wallmountedViewController.gotoWallmountedDetail, sender: indexPath.row)
    }

}

// MARK: UISearchBar Delegate

extension WallmountedViewController {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchText = searchText
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.searchText = ""
    }
    
}
