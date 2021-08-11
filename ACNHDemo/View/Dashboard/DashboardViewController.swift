//
//  DashboardViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/14.
//

import UIKit

class DashboardViewController: UIViewController {

    let viewModel = DashboardVCViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initViews()
    }
    
    func initViews() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = viewModel.getTodayInfo()
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
