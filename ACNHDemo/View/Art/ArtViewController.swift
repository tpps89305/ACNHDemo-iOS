//
//  ArtViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/16.
//

import UIKit

class ArtViewController: BaseTableViewController {
    
    let viewModel = ArtVCViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        bindViewModel()
        viewModel.getArt()
        tableView.register(R.nib.commonCell)
    }
    
    func bindViewModel() {
        viewModel.onRequestEnd = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

}

// MARK: - Table view data source

extension ArtViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.artCellViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.commonCell, for: indexPath) else {
            fatalError("Cannot dequeue CommonCell!")
        }
        let listCellViewModel = viewModel.artCellViewModels[indexPath.row]
        cell.setup(viewModel: listCellViewModel)
        return cell
    }
    
}

// MARK: UISearchBar Delegate

extension ArtViewController {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchText = searchText
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.searchText = ""
    }
    
}
