//
//  ViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/5/23.
//

import UIKit
import Moya
import Alamofire

class VillagersController: UITableViewController {
    
    var arrayVillagers = Array<Villager>()
    @IBOutlet var tableViewVillagers: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initViews()
        getVillagers()
    }
    
    func initViews() {
        self.tableViewVillagers.register(UINib(nibName: "VillagersCell", bundle: nil), forCellReuseIdentifier: "Cell")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! VillagersCell
        let villager = arrayVillagers[indexPath.row]
        let nameTW = villager.name.nameTWzh
        let iconUri = villager.iconURI
        cell.labelVillager.text = nameTW
        cell.imageVillager.loadUrl(url: iconUri, cell: cell)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "gotoVillagerDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "gotoVillagerDetail", let destinationVC = segue.destination as? VillagerDetailViewController {
            if let row = tableView.indexPathForSelectedRow?.row {
                destinationVC.villager = arrayVillagers[row]
            }
        }
    }

}
