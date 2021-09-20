//
//  DashboardViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/14.
//

import UIKit

class DashboardViewController: UIViewController {

    let viewModel = DashboardVCViewModel()

    @IBOutlet weak var labelAvailableFishes: UILabel!
    @IBOutlet weak var labelAvailabelSeaCreature: UILabel!
    @IBOutlet weak var labelAvailabelBugs: UILabel!
    @IBOutlet weak var collectionDaily: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initViews()
        bindViewModel()
    }
    
    func initViews() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = viewModel.getTodayInfo()
        labelAvailableFishes.text = "..."
        labelAvailabelSeaCreature.text = "..."
        labelAvailabelBugs.text = "..."
    }
    
    func bindViewModel() {
        viewModel.getAvailableFish { countOfFishes in
            self.labelAvailableFishes.text = String(countOfFishes)
        }
        viewModel.getAvailableSeaCreatures { (countOfSeaCreatures) in
            self.labelAvailabelSeaCreature.text = String(countOfSeaCreatures)
        }
        viewModel.getAvailableBugs { (countOfBugs) in
            self.labelAvailabelBugs.text = String(countOfBugs)
        }
        viewModel.getDailyTasks {
            self.collectionDaily.reloadData()
        }
    }
    
    @IBAction func viewFishPress(_ sender: UITapGestureRecognizer) {
    }
    
    @IBAction func viewSeaCreaturePress(_ sender: UITapGestureRecognizer) {
    }
    
    @IBAction func viewBugsPress(_ sender: UITapGestureRecognizer) {
    }
    
    @IBAction func resetDailyTaskPress(_ sender: UIButton) {
        viewModel.resetDailyTask {
            self.collectionDaily.reloadData()
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

extension DashboardViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.dailyTaskCellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.CellID.DAILY_ITEM, for: indexPath) as! DailyTaskCell
        cell.setup(viewModel: viewModel.dailyTaskCellViewModels[indexPath.row])
        return cell
    }
    
}
