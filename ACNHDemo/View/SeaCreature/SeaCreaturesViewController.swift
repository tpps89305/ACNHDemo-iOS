//
//  SeaCreatureViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/15.
//

import UIKit

class SeaCreaturesViewController: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    let viewModel = SeaCreaturesVCViewModel()
    var availableTime = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
        bindViewModel()
        viewModel.getSeaCreatures(availableTime: availableTime)
    }
    
    func initViews() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.delegate = self
        tableView.register(UINib(nibName: String(describing: CommonCell.self), bundle: nil), forCellReuseIdentifier: Constant.CellID.COMMON_CELL)
        // Avoid issue of cannot select cell(s)
        searchController.obscuresBackgroundDuringPresentation = false
    }
    
    func bindViewModel() {
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
        if segue.identifier == Constant.SegueID.GOTO_SEA_CREATURE_DETAIL, let destinationVC = segue.destination as? SeaCreatureDetailViewController {
            if let row = tableView.indexPathForSelectedRow?.row {
                destinationVC.seaCreature = viewModel.seaCreatureCellViewModels[row].seaCreature
            }
        }
    }
    

}

// MARK: - Table view data source

extension SeaCreaturesViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        viewModel.seaCreatureCellViewModels.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.CellID.COMMON_CELL, for: indexPath) as! CommonCell
        let listCellViewModel = viewModel.seaCreatureCellViewModels[indexPath.row]
        cell.setup(viewModel: listCellViewModel)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constant.SegueID.GOTO_SEA_CREATURE_DETAIL, sender: self)
    }
    
}

//MARK: - UISearchBar Delegate

extension SeaCreaturesViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchText = searchText
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.searchText = ""
    }
    
}
