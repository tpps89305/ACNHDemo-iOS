//
//  SeaCreatureViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/15.
//

import UIKit

class SeaCreaturesViewController: BaseTableViewController {
    
    private let viewModel = SeaCreaturesVCViewModel()
    var availableTime = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bindViewModel()
        viewModel.getSeaCreatures(availableTime: availableTime)
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
        if let typedInfo = R.segue.seaCreaturesViewController.gotoSeaCreatureDetail(segue: segue),
           let row = sender as? Int {
            typedInfo.destination.seaCreature = viewModel.seaCreatureCellViewModels[row].seaCreature
        }
    }
    
}

// MARK: - Table view data source

extension SeaCreaturesViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.seaCreatureCellViewModels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.commonCell, for: indexPath) else {
            fatalError("Cannot dequeue CommonCell!")
        }
        let listCellViewModel = viewModel.seaCreatureCellViewModels[indexPath.row]
        cell.setup(viewModel: listCellViewModel)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(
            withIdentifier: R.segue.seaCreaturesViewController.gotoSeaCreatureDetail,
            sender: indexPath.row)
    }
    
}

// MARK: - UISearchBar Delegate

extension SeaCreaturesViewController {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchText = searchText
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.searchText = ""
    }
    
}
