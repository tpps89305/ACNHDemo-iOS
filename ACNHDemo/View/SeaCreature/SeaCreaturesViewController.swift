//
//  SeaCreatureViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/15.
//

import UIKit

class SeaCreaturesViewController: UITableViewController, UISearchBarDelegate {
    
    let searchController = UISearchController(searchResultsController: nil)
    let viewModel = SeaCreaturesVCViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
        bindViewModel()
        viewModel.getSeaCreatures()
    }
    
    func initViews() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.delegate = self
        self.tableView.register(UINib(nibName: "FishesCell", bundle: nil), forCellReuseIdentifier: "FishesCell")
        // Avoid issue of cannot select cell(s)
        searchController.dimsBackgroundDuringPresentation = false
    }
    
    func bindViewModel() {
        viewModel.onRequestEnd = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.seaCreatureCellViewModels.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FishesCell", for: indexPath) as! FishesCell
        let listCellViewModel = viewModel.seaCreatureCellViewModels[indexPath.row]
        cell.setup(viewModel: listCellViewModel)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "gotoSeaCreatureDetail", sender: self)
    }
    
    //MARK: UISearchBar Delegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchText = searchText
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.searchText = ""
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "gotoSeaCreatureDetail", let destinationVC = segue.destination as? SeaCreatureDetailViewController {
            if let row = tableView.indexPathForSelectedRow?.row {
                destinationVC.seaCreature = viewModel.seaCreatureCellViewModels[row].seaCreature
            }
        }
    }
    

}
