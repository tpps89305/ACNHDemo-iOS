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
    var delegate:(() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewModel.getDailyTasks {
            self.tableDailyTask.reloadData()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        delegate!()
    }
    
    @IBAction func buttonClosePress(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.dailyTaskCellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.dailyTaskDetailCell, for: indexPath) else {
            fatalError("Cannot dequeue DailyTaskCell!")
        }
        cell.setup(dailyTask: viewModel.dailyTaskCellViewModels[indexPath.row].dailyTask)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: R.segue.dailyTaskDetailViewController.gotoEditTask, sender: viewModel.dailyTaskCellViewModels[indexPath.row].dailyTask)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let typedInfo = R.segue.dailyTaskDetailViewController.gotoEditTask(segue: segue),
           let dailyTask = sender as? DailyTask {
            typedInfo.destination.viewModel.dailyTask = dailyTask
            typedInfo.destination.delegate = { [weak self] in
                self?.viewModel.getDailyTasks {
                    self?.tableDailyTask.reloadData()
                }
            }
        }
    }
    
}
