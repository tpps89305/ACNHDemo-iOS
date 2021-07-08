//
//  ViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/5/23.
//

import UIKit
import Moya
import Alamofire

class VillagersController: UITableViewController, UISearchBarDelegate {
    
    var arrayVillagers = Array<Villager>()
    var searchController = UISearchController(searchResultsController: nil)
    var searchReslut = [Villager]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initViews()
        getVillagers()
    }
    
    func initViews() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.delegate = self
        self.tableView.register(UINib(nibName: "VillagersCell", bundle: nil), forCellReuseIdentifier: "Cell")
        // Avoid issue of cannot select cell(s)
        searchController.dimsBackgroundDuringPresentation = false
    }
    
    func getVillagers() {
        ACNHProvider.request(.villagers(villagerId: 0)) { result in
            do {
                let response = try result.get()
                let villagers = try newJSONDecoder().decode(Villagers.self, from: response.data)
                for eachKey in villagers.keys {
                    self.arrayVillagers.append(villagers[eachKey]!)
                }
                self.searchReslut = self.arrayVillagers
                self.tableView.reloadData()
                print("Done!")
            } catch {
                print("Error!")
            }
        }
    }

    // MARK: UITableView Delegate and DataSources
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchReslut.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! VillagersCell
        let villager = searchReslut[indexPath.row]
        let nameTW = villager.name.nameTWzh
        let iconUri = villager.iconURI
        cell.labelVillager.text = nameTW
        cell.imageVillager.loadUrl(url: iconUri, cell: cell)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "gotoVillagerDetail", sender: self)
    }
    
    //MARK: UISearchBar Delegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == "" {
            searchReslut = arrayVillagers
            return
        }
        searchReslut = arrayVillagers.filter({ (villager) -> Bool in
            return villager.name.nameTWzh.contains(searchBar.text!)
        })
    }
    
    // MARK: Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "gotoVillagerDetail", let destinationVC = segue.destination as? VillagerDetailViewController {
            if let row = tableView.indexPathForSelectedRow?.row {
                destinationVC.villager = searchReslut[row]
            }
        }
    }

}
