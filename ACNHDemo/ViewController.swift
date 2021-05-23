//
//  ViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/5/23.
//

import UIKit
import Moya

class ViewController: UITableViewController {
    
    var arrayVillagers = Array<NSDictionary>()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getVillagers()
    }
    
    func getVillagers() {
        ACNHProvider.request(.villagers(villagerId: 0)) { result in
            do {
                let response = try result.get()
                let value = try response.mapNSDict()
                var result = Array<NSDictionary>()
                var arrayCount = 0
                
                for eachValue in value.allValues {
                    result.append(eachValue as! NSDictionary)
                    // Load 10 villagers only
                    if arrayCount > 9 {
                        break
                    }
                    arrayCount += 1
                }
                self.arrayVillagers = result
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        let villager = arrayVillagers[indexPath.row]
        let dictName = villager.value(forKey: "name") as! NSDictionary
        let nameTW = dictName.value(forKey: "name-TWzh") as! String
        cell.textLabel?.text = nameTW
        return cell
    }

}

