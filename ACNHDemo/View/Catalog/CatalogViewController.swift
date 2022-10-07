//
//  CatalogViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/8.
//

import UIKit

class CatalogViewController: UITableViewController {
    
    private let arrayCatalog = [
        TitleIconPair(title: "Songs", icon: R.image.music()),
        TitleIconPair(title: "Fishes", icon: R.image.fish0()),
        TitleIconPair(title: "Sea Creatures", icon: R.image.akoyagai()),
        TitleIconPair(title: "Bugs", icon: R.image.bug0()),
        TitleIconPair(title: "Fossils", icon: R.image.fossil_NH_Inv_Icon()),
        TitleIconPair(title: "Art", icon: R.image.art()),
        TitleIconPair(title: "BGM", icon: R.image.music()),
        TitleIconPair(title: "Houseware", icon: R.image.housewares()),
        TitleIconPair(title: "Wallmounted", icon: R.image.wallmounted())
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.catalogCell, for: indexPath) else {
            fatalError("Cannot dequeue CatalogCell!")
        }
        cell.labelName.text = arrayCatalog[indexPath.row].title
        cell.imageIcon.image = arrayCatalog[indexPath.row].icon
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: R.segue.catalogViewController.gotoSongs, sender: self)
        case 1:
            performSegue(withIdentifier: R.segue.catalogViewController.gotoFishes, sender: self)
        case 2:
            performSegue(withIdentifier: R.segue.catalogViewController.gotoSeaCreature, sender: self)
        case 3:
            performSegue(withIdentifier: R.segue.catalogViewController.gotoBugs, sender: self)
        case 4:
            performSegue(withIdentifier: R.segue.catalogViewController.gotoFossils, sender: self)
        case 5:
            performSegue(withIdentifier: R.segue.catalogViewController.gotoArt, sender: self)
        case 6:
            performSegue(withIdentifier: R.segue.catalogViewController.gotoBGM, sender: self)
        case 7:
            performSegue(withIdentifier: R.segue.catalogViewController.gotoHousewares, sender: self)
        case 8:
            performSegue(withIdentifier: R.segue.catalogViewController.gotoWallmounted, sender: self)
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
