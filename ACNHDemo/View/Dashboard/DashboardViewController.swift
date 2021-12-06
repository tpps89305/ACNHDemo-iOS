//
//  DashboardViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/14.
//

import UIKit

class DashboardViewController: UIViewController {

    let viewModel = DashboardVCViewModel()

    @IBOutlet weak var collectionDaily: UICollectionView!
    @IBOutlet weak var collectionBirthday: UICollectionView!
    @IBOutlet weak var collectionAvailable: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initViews()
        bindViewModel()
    }
    
    func initViews() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = viewModel.getTodayInfo()
        collectionBirthday.register(R.nib.dailyBirthdayCell)
        collectionAvailable.register(R.nib.availableNowCell)
    }
    
    func bindViewModel() {
        viewModel.getDailyTasks {
            self.collectionDaily.reloadData()
        }
        viewModel.getBirthdayVillager {
            self.collectionBirthday.reloadData()
        }
        viewModel.getAvailableNowInfo { indexPaths in
            self.collectionAvailable.reloadItems(at: indexPaths)
        }
    }
    
    @IBAction func resetDailyTaskPress(_ sender: UIButton) {
        viewModel.resetDailyTask {
            self.collectionDaily.reloadData()
        }
    }
    
    @IBAction func gotoDailyTaskDetail(_ sender: UIButton) {
        performSegue(withIdentifier: R.segue.dashboardViewController.gotoDailyTaskDetail, sender: self)
    }
    
    // MARK: Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let typedInfo = R.segue.dashboardViewController.gotoBirthdayVillager(segue: segue),
            let row = sender as? Int {
            typedInfo.destination.villager = viewModel.dailyBirthdayCellViewModels[row].villager
        } else if let typedInfo = R.segue.dashboardViewController.gotoFishes(segue: segue) {
            typedInfo.destination.availableTime = true
        } else if let typedInfo = R.segue.dashboardViewController.gotoSeaCreature(segue: segue) {
            typedInfo.destination.availableTime = true
        } else if let typedInfo = R.segue.dashboardViewController.gotoBugs(segue: segue) {
            typedInfo.destination.availableTime = true
        }
    }

}

extension DashboardViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionDaily {
            return viewModel.dailyTaskCellViewModels.count
        } else if collectionView == collectionBirthday {
            return viewModel.dailyBirthdayCellViewModels.count
        } else if collectionView == collectionAvailable {
            return viewModel.availableNowCellViewModels.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionDaily {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.dailyItem, for: indexPath) else {
                fatalError("Cannot dequeue DailyTaskCell!")
            }
            cell.setup(viewModel: viewModel.dailyTaskCellViewModels[indexPath.row])
            return cell
        } else if collectionView == collectionBirthday {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.dailyBirthdayCell, for: indexPath) else {
                fatalError("Cannot dequeue DailyBirthdayCell!")
            }
            cell.setup(viewModel: viewModel.dailyBirthdayCellViewModels[indexPath.row])
            return cell
        } else if collectionView == collectionAvailable {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.availableNowCell, for: indexPath) else {
                fatalError("Cannot dequeue AvailableNowCell!")
            }
            cell.setup(viewModel: viewModel.availableNowCellViewModels[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionBirthday {
            performSegue(withIdentifier: R.segue.dashboardViewController.gotoBirthdayVillager, sender: indexPath.row)
        } else if collectionView == collectionAvailable {
            switch indexPath.row {
            case 0:
                performSegue(withIdentifier: R.segue.dashboardViewController.gotoFishes, sender: nil)
            case 1:
                performSegue(withIdentifier: R.segue.dashboardViewController.gotoSeaCreature, sender: nil)
            case 2:
                performSegue(withIdentifier: R.segue.dashboardViewController.gotoBugs, sender: nil)
            default:
                break
            }
        }
    }
    
}
