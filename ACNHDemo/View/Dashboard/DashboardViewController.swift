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
    @IBOutlet weak var collectionBirthday: UICollectionView!
    
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
        collectionBirthday.register(UINib(nibName: String(describing: DailyBirthdayCell.self), bundle: nil), forCellWithReuseIdentifier: Constant.CellID.DAILY_BIRTHDAY)
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
        viewModel.getBirthdayVillager {
            self.collectionBirthday.reloadData()
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
    
    // MARK: Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == Constant.SegueID.GOTO_BIRTHDAY_VILLAGER, let destinationVC = segue.destination as? VillagerDetailViewController {
            if let row = collectionBirthday.indexPathsForSelectedItems?[0].row {
                destinationVC.villager = viewModel.dailyBirthdayCellViewModels[row].villager
            }
        }
    }

}

extension DashboardViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionDaily {
            return viewModel.dailyTaskCellViewModels.count
        } else if collectionView == collectionBirthday {
            return viewModel.dailyBirthdayCellViewModels.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionDaily {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.CellID.DAILY_ITEM, for: indexPath) as! DailyTaskCell
            cell.setup(viewModel: viewModel.dailyTaskCellViewModels[indexPath.row])
            return cell
        } else if collectionView == collectionBirthday {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.CellID.DAILY_BIRTHDAY, for: indexPath) as! DailyBirthdayCell
            cell.setup(viewModel: viewModel.dailyBirthdayCellViewModels[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionBirthday {
            performSegue(withIdentifier: Constant.SegueID.GOTO_BIRTHDAY_VILLAGER, sender: self)
        }
    }
    
}
