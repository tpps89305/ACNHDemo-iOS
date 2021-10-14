//
//  ViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/5/23.
//

import UIKit
import Moya
import Alamofire

class VillagersViewController: UITableViewController, UISearchBarDelegate {
    
    let searchController = UISearchController(searchResultsController: nil)
    let viewModel = VillagerVCViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initViews()
        bindViewModel()
        viewModel.getVillagers()
    }
    
    func initViews() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.delegate = self
        tableView.register(UINib(nibName: String(describing: VillagersCell.self), bundle: nil), forCellReuseIdentifier: Constant.CellID.VILLAGERS_CELL)
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

    // MARK: UITableView Delegate and DataSources
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.villagerCellViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.CellID.VILLAGERS_CELL, for: indexPath) as? VillagersCell else {
            fatalError("Cannot dequeue VillagersCell!")
        }
        let listCellViewModel = viewModel.villagerCellViewModels[indexPath.row]
        cell.setup(viewModel: listCellViewModel)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constant.SegueID.GOTO_VILLAGER_DETAIL, sender: self)
    }
    
    // MARK: UISearchBar Delegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchText = searchText
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.searchText = ""
    }
    
    // MARK: Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == Constant.SegueID.GOTO_VILLAGER_DETAIL, let destinationVC = segue.destination as? VillagerDetailViewController {
            if let row = tableView.indexPathForSelectedRow?.row {
                destinationVC.villager = viewModel.villagerCellViewModels[row].villager
            }
        }
    }

}
