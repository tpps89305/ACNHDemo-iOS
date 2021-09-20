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
        let cell = tableView.dequeueReusableCell(withIdentifier: "CatalogCell", for: indexPath) as! CatalogCell
        cell.labelName?.text = arrayCatalog[indexPath.row].title
        cell.imageIcon?.image = arrayCatalog[indexPath.row].icon
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: Constant.SegueID.GOTO_SONGS, sender: self)
            break
        case 1:
            performSegue(withIdentifier: Constant.SegueID.GOTO_FISHES, sender: self)
            break
        case 2:
            performSegue(withIdentifier: Constant.SegueID.GOTO_SEA_CREATURES, sender: self)
            break
        case 3:
            performSegue(withIdentifier: Constant.SegueID.GOTO_BUGS, sender: self)
            break
        case 4:
            performSegue(withIdentifier: Constant.SegueID.GOTO_FOSSILS, sender: self)
            break
        case 5:
            performSegue(withIdentifier: Constant.SegueID.GOTO_ART, sender: self)
            break
        case 6:
            performSegue(withIdentifier: Constant.SegueID.GOTO_BGM, sender: self)
            break
        case 7:
            performSegue(withIdentifier: Constant.SegueID.GOTO_HOUSEWARES, sender: self)
            break
        case 8:
            performSegue(withIdentifier: Constant.SegueID.GOTO_WALLMOUNTED, sender: self)
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
