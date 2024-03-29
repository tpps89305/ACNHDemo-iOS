//
//  FossilsViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/16.
//

import UIKit

class FossilsViewController: BaseTableViewController {
    
    private let viewModel = FossilsVCViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        bindViewModel()
        viewModel.getFossils()
        tableView.register(R.nib.commonCell)
    }
    
    private func bindViewModel() {
        viewModel.onRequestEnd = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

}

// MARK: - Table view Delegate & Data Source

extension FossilsViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.fossilCellViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.commonCell, for: indexPath) else {
            fatalError("Cannot dequeue CommonCell!")
        }
        let listCellViewModel = viewModel.fossilCellViewModels[indexPath.row]
        cell.setup(viewModel: listCellViewModel)
        return cell
    }
    
}

// MARK: UISearchBar Delegate

extension FossilsViewController {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchText = searchText
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.searchText = ""
    }
    
}
