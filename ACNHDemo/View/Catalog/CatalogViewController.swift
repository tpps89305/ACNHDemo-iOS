//
//  CatalogViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/8.
//

import UIKit

class CatalogViewController: UITableViewController {
    
    let arrayCatalog = [
        TitleIconPair(title: "Songs", iconName: Constant.IconName.MUSIC),
        TitleIconPair(title: "Fishes", iconName: Constant.IconName.FISH),
        TitleIconPair(title: "Sea Creatures", iconName: Constant.IconName.SEA_CREATURE),
        TitleIconPair(title: "Bugs", iconName: Constant.IconName.BUG),
        TitleIconPair(title: "Fossils", iconName: Constant.IconName.FOSSIL),
        TitleIconPair(title: "Art", iconName: Constant.IconName.ART),
        TitleIconPair(title: "BGM", iconName: Constant.IconName.MUSIC),
        TitleIconPair(title: "Houseware", iconName: Constant.IconName.HOUSEWARE),
        TitleIconPair(title: "Wallmounted", iconName: Constant.IconName.WALLMOUNTED)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayCatalog.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.CellID.CATALOG_CELL, for: indexPath) as? CatalogCell else {
            fatalError("Cannot dequeue CatalogCell!")
        }
        cell.labelName.text = arrayCatalog[indexPath.row].title
        cell.imageIcon.image = arrayCatalog[indexPath.row].icon
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: Constant.SegueID.GOTO_SONGS, sender: self)
        case 1:
            performSegue(withIdentifier: Constant.SegueID.GOTO_FISHES, sender: self)
        case 2:
            performSegue(withIdentifier: Constant.SegueID.GOTO_SEA_CREATURES, sender: self)
        case 3:
            performSegue(withIdentifier: Constant.SegueID.GOTO_BUGS, sender: self)
        case 4:
            performSegue(withIdentifier: Constant.SegueID.GOTO_FOSSILS, sender: self)
        case 5:
            performSegue(withIdentifier: Constant.SegueID.GOTO_ART, sender: self)
        case 6:
            performSegue(withIdentifier: Constant.SegueID.GOTO_BGM, sender: self)
        case 7:
            performSegue(withIdentifier: Constant.SegueID.GOTO_HOUSEWARES, sender: self)
        case 8:
            performSegue(withIdentifier: Constant.SegueID.GOTO_WALLMOUNTED, sender: self)
        default:
            break
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
}
