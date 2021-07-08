//
//  SongsViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/8.
//

import UIKit

class SongsViewController: UITableViewController, UISearchBarDelegate {
    
    var arraySongs = Array<Song>()
    var searchController = UISearchController(searchResultsController: nil)
    var searchReslut = [Song]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
        getSongs()
    }
    
    func initViews() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.delegate = self
        self.tableView.register(UINib(nibName: "SongsCell", bundle: nil), forCellReuseIdentifier: "SongsCell")
        // Avoid issue of cannot select cell(s)
        searchController.dimsBackgroundDuringPresentation = false
    }
    
    func getSongs() {
        ACNHProvider.request(.songs(songId: 0)) { result in
            do {
                let response = try result.get()
                let songs = try newJSONDecoder().decode(Songs.self, from: response.data)
                for eachKey in songs.keys {
                    self.arraySongs.append(songs[eachKey]!)
                }
                self.searchReslut = self.arraySongs
                self.tableView.reloadData()
                print("Done!")
            } catch {
                print("Error!")
            }
        }
    }

    // MARK: UITableView Delegate and DataSources

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return searchReslut.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongsCell", for: indexPath) as! SongsCell
        cell.imageAvatar?.loadUrl(url: searchReslut[indexPath.row].imageURI, cell: cell)
        cell.labelName.text = searchReslut[indexPath.row].name.nameTWzh
        cell.labelPriceInfo.text = String(searchReslut[indexPath.row].sellPrice)
        return cell
    }
    
    //MARK: UISearchBar Delegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == "" {
            searchReslut = arraySongs
            return
        }
        searchReslut = arraySongs.filter({ (song) -> Bool in
            return song.name.nameTWzh.contains(searchBar.text!)
        })
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
