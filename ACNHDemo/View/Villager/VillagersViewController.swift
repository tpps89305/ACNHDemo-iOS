//
//  ViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/5/23.
//

import UIKit

class VillagersViewController: BaseTableViewController {
    
    let viewModel = VillagerVCViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bindViewModel()
        viewModel.getVillagers()
        tableView.register(R.nib.villagersCell)
    }
    
    func bindViewModel() {
        viewModel.onRequestEnd = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    // MARK: Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let typedInfo = R.segue.villagersViewController.gotoVillagerDetail(segue: segue),
           let row = sender as? Int {
            typedInfo.destination.villager = viewModel.villagerCellViewModels[row].villager
        }
    }

}

// MARK: UITableView Delegate and DataSources

extension VillagersViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.villagerCellViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.villagersCell, for: indexPath) else {
            fatalError("Cannot dequeue VillagersCell!")
        }
        let listCellViewModel = viewModel.villagerCellViewModels[indexPath.row]
        cell.setup(viewModel: listCellViewModel)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(
            withIdentifier: R.segue.villagersViewController.gotoVillagerDetail,
            sender: indexPath.row)
    }
    
}

// MARK: UISearchBar Delegate

extension VillagersViewController {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchText = searchText
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.searchText = ""
    }
    
}
