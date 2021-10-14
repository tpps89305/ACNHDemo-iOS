//
//  SongsViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/8.
//

import UIKit

class SongsViewController: UITableViewController, UISearchBarDelegate {
    
    let searchController = UISearchController(searchResultsController: nil)
    let viewModel = SongsVCViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
        bindViewModel()
        viewModel.getSongs()
    }
    
    func initViews() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.delegate = self
        tableView.register(UINib(nibName: String(describing: SongsCell.self), bundle: nil), forCellReuseIdentifier: Constant.CellID.SONGS_CELL)
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
        viewModel.songCellViewModels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.CellID.SONGS_CELL, for: indexPath) as? SongsCell else {
            fatalError("Cannot dequeue SongsCell!")
        }
        let listCellViewModel = viewModel.songCellViewModels[indexPath.row]
        cell.setup(viewModel: listCellViewModel)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constant.SegueID.GOTO_SONG_DETAIL, sender: self)
    }
    
    // MARK: UISearchBar Delegate
    
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
        if segue.identifier == Constant.SegueID.GOTO_SONG_DETAIL, let destinationVC = segue.destination as? SongDetailViewController {
            if let row = tableView.indexPathForSelectedRow?.row {
                destinationVC.song = viewModel.songCellViewModels[row].song
            }
        }
    }
    
}
