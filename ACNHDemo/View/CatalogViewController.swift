//
//  CatalogViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/8.
//

import UIKit

class CatalogViewController: UITableViewController {
    
    let arrayCatalog = [
        TitleIconPair(title: "Songs", iconName: "Music"),
        TitleIconPair(title: "Fishes", iconName: "Fish0"),
        TitleIconPair(title: "Sea Creatures", iconName: "Akoyagai"),
        TitleIconPair(title: "Bugs", iconName: "Bug0"),
        TitleIconPair(title: "Fossils", iconName: "Fossil_NH_Inv_Icon"),
        TitleIconPair(title: "Art", iconName: "Art"),
        TitleIconPair(title: "BGM", iconName: "Music"),
        TitleIconPair(title: "Houseware", iconName: "Housewares"),
        TitleIconPair(title: "Wallmounted", iconName: "Wallmounted")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "CatalogCell", for: indexPath) as! CatalogCell
        cell.labelName?.text = arrayCatalog[indexPath.row].title
        cell.imageIcon?.image = arrayCatalog[indexPath.row].icon
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "gotoSongs", sender: self)
            break
        case 1:
            performSegue(withIdentifier: "gotoFishes", sender: self)
            break
        case 2:
            performSegue(withIdentifier: "gotoSeaCreature", sender: self)
            break
        case 3:
            performSegue(withIdentifier: "gotoBugs", sender: self)
            break
        case 4:
            performSegue(withIdentifier: "gotoFossils", sender: self)
            break
        case 5:
            performSegue(withIdentifier: "gotoArt", sender: self)
            break
        case 6:
            performSegue(withIdentifier: "gotoBGM", sender: self)
            break
        case 7:
            performSegue(withIdentifier: "gotoHousewares", sender: self)
            break
        case 8:
            performSegue(withIdentifier: "gotoWallmounted", sender: self)
            break
        default:
            break
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
