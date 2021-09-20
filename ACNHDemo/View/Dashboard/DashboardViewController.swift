//
//  DashboardViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/14.
//

import UIKit

class DashboardViewController: UIViewController {

    let viewModel = DashboardVCViewModel()
    let arrayDailyTask = [
        DailyTask(iconName: Constant.IconName.OREIRON, currentValue: 0, maxValue: 3),
        DailyTask(iconName: Constant.IconName.FOSSIL, currentValue: 0, maxValue: 3),
        DailyTask(iconName: Constant.IconName.PIETRO, currentValue: 3, maxValue: 5),
        DailyTask(iconName: Constant.IconName.FURNITURE_NH, currentValue: 0, maxValue: 3),
        DailyTask(iconName: Constant.IconName.BELL, currentValue: 0, maxValue: 3),
        DailyTask(iconName: Constant.IconName.PLANE_TICKET, currentValue: 0, maxValue: 3),
        DailyTask(iconName: Constant.IconName.MESSAGE_BOTTLE, currentValue: 0, maxValue: 3),
        DailyTask(iconName: Constant.IconName.RECIPE, currentValue: 0, maxValue: 3)
    ]

    @IBOutlet weak var labelAvailableFishes: UILabel!
    @IBOutlet weak var labelAvailabelSeaCreature: UILabel!
    @IBOutlet weak var labelAvailabelBugs: UILabel!
    @IBOutlet weak var collectionDaily: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initViews()
//        bindViewModel()
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
    }
    
    @IBAction func viewFishPress(_ sender: UITapGestureRecognizer) {
    }
    
    @IBAction func viewSeaCreaturePress(_ sender: UITapGestureRecognizer) {
    }
    
    @IBAction func viewBugsPress(_ sender: UITapGestureRecognizer) {
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
        arrayDailyTask.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.CellID.DAILY_ITEM, for: indexPath) as! DailyTaskCell
        cell.dailyButton.iconTask = UIImage.init(named: arrayDailyTask[indexPath.row].iconName)
        cell.dailyButton.maxValue = arrayDailyTask[indexPath.row].maxValue
        cell.dailyButton.currentValue = arrayDailyTask[indexPath.row].currentValue
        return cell
    }
    
}
