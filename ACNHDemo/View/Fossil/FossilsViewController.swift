//
//  FossilsViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/16.
//

import UIKit

class FossilsViewController: UITableViewController, UISearchBarDelegate {
    
    let searchController = UISearchController(searchResultsController: nil)
    let viewModel = FossilsVCViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initViews()
        bindViewModel()
        viewModel.getFossils()
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
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.fossilCellViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.CellID.COMMON_CELL, for: indexPath) as? CommonCell else {
            fatalError("Cannot dequeue CommonCell!")
        }
        let listCellViewModel = viewModel.fossilCellViewModels[indexPath.row]
        cell.setup(viewModel: listCellViewModel)
        return cell
    }
    
    // MARK: UISearchBar Delegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchText = searchText
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.searchText = ""
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
