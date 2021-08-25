//
//  WallmountedViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/8/9.
//

import UIKit

class WallmountedViewController: UITableViewController, UISearchBarDelegate {

    let searchController = UISearchController(searchResultsController: nil)
    let viewModel = WallmountedVCViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
        bindViewModel()
        viewModel.getWallmounted()
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
        // #warning Incomplete implementation, return the number of rows
        viewModel.wallmountedCellViewModels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.CellID.COMMON_CELL, for: indexPath) as! CommonCell
        let listCellViewModel = viewModel.wallmountedCellViewModels[indexPath.row]
        cell.setup(viewModel: listCellViewModel)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constant.SegueID.GOTO_WALLMOUNTED_DETAIL, sender: self)
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
        if segue.identifier == Constant.SegueID.GOTO_WALLMOUNTED_DETAIL, let destinationVC = segue.destination as? WallmountedDetailViewController {
            if let row = tableView.indexPathForSelectedRow?.row {
                destinationVC.wallmounted = viewModel.wallmountedCellViewModels[row].wallmounted
            }
        }
    }

}
