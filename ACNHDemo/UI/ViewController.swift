//
//  ViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/5/23.
//

import UIKit
import Moya
import Alamofire

class ViewController: UITableViewController {
    
    var arrayVillagers = Array<Villager>()
    @IBOutlet var tableViewVillagers: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initViews()
        getVillagers()
    }
    
    func initViews() {
        self.tableViewVillagers.register(UINib(nibName: "VillagersTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }
    
    func getVillagers() {
        ACNHProvider.request(.villagers(villagerId: 0)) { result in
            do {
                let response = try result.get()
                let villagers = try newJSONDecoder().decode(Villagers.self, from: response.data)
                for eachKey in villagers.keys {
                    self.arrayVillagers.append(villagers[eachKey]!)
                }
                self.tableView.reloadData()
                print("Done!")
            } catch {
                print("Error!")
            }
        }
    }

// MARK: UITableView Delegate and DataSources
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayVillagers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! VillagersTableViewCell
        let villager = arrayVillagers[indexPath.row]
        let nameTW = villager.name.nameTWzh
        let iconUri = villager.iconURI
        cell.labelVillager.text = nameTW
        cell.imageVillager.loadUrl(url: iconUri, cell: cell)
        return cell
    }

}
