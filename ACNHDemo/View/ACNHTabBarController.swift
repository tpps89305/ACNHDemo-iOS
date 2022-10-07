//
//  ACNHTabBarController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2022/10/7.
//

import UIKit

class ACNHTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let items = tabBar.items {
            for item in items {
                item.setTitleTextAttributes([.foregroundColor: R.color.sectionTitle()!], for: .normal)
            }
        }
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
