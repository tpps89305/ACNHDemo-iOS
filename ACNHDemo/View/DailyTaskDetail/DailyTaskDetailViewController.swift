//
//  DailyTaskDetailViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/10/18.
//

import UIKit

class DailyTaskDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableDailyTask: UITableView!
    private let viewModel = DailyTaskDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewModel.getDailyTasks {
            self.tableDailyTask.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.dailyTaskCellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.CellID.dailyTaskDetailCell, for: indexPath) as? DailyTaskDetailCell else {
            fatalError("Cannot dequeue DailyTaskCell!")
        }
        cell.setup(dailyTask: viewModel.dailyTaskCellViewModels[indexPath.row].dailyTask)
        return cell
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
