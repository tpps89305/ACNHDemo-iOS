//
//  SongsViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/8.
//

import UIKit

class SongsViewController: BaseTableViewController {
    
    let viewModel = SongsVCViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bindViewModel()
        viewModel.getSongs()
        tableView.register(R.nib.songsCell)
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
        if let typedInfo = R.segue.songsViewController.gotoSongDetail(segue: segue),
           let row = sender as? Int {
            typedInfo.destination.song = viewModel.songCellViewModels[row].song
        }
    }
    
}

// MARK: UITableView Delegate and DataSources

extension SongsViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.songCellViewModels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.songsCell, for: indexPath) else {
            fatalError("Cannot dequeue SongsCell!")
        }
        let listCellViewModel = viewModel.songCellViewModels[indexPath.row]
        cell.setup(viewModel: listCellViewModel)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(
            withIdentifier: R.segue.songsViewController.gotoSongDetail,
            sender: indexPath.row)
    }
    
}

// MARK: UISearchBar Delegate

extension SongsViewController {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchText = searchText
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.searchText = ""
    }
    
}
