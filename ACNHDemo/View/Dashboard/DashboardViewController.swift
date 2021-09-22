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
        collectionBirthday.register(UINib(nibName: String(describing: DailyBirthdayCell.self), bundle: nil), forCellWithReuseIdentifier: Constant.CellID.DAILY_BIRTHDAY)
        collectionAvailable.register(UINib(nibName: String(describing: AvailableNowCell.self), bundle: nil), forCellWithReuseIdentifier: Constant.CellID.AVAILABLE_NOW)
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
    
    // MARK: Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == Constant.SegueID.GOTO_BIRTHDAY_VILLAGER, let destinationVC = segue.destination as? VillagerDetailViewController {
            if let row = collectionBirthday.indexPathsForSelectedItems?[0].row {
                destinationVC.villager = viewModel.dailyBirthdayCellViewModels[row].villager
            }
        } else if segue.identifier == Constant.SegueID.GOTO_FISHES, let destinationVC  = segue.destination as? FishesViewController {
            // TODO: Go to FishesViewController
            destinationVC.availableTime = true
        } else if segue.identifier == Constant.SegueID.GOTO_SEA_CREATURES, let destinationVC = segue.destination as? SeaCreaturesViewController {
            // TODO: Go to SeaCreaturesViewController
            destinationVC.availableTime = true
        } else if segue.identifier == Constant.SegueID.GOTO_BUGS, let destinationVC = segue.destination as? BugsViewController {
            // TODO: Go to BugsViewController
            destinationVC.availableTime = true
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.CellID.DAILY_ITEM, for: indexPath) as! DailyTaskCell
            cell.setup(viewModel: viewModel.dailyTaskCellViewModels[indexPath.row])
            return cell
        } else if collectionView == collectionBirthday {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.CellID.DAILY_BIRTHDAY, for: indexPath) as! DailyBirthdayCell
            cell.setup(viewModel: viewModel.dailyBirthdayCellViewModels[indexPath.row])
            return cell
        } else if collectionView == collectionAvailable {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.CellID.AVAILABLE_NOW, for: indexPath) as! AvailableNowCell
            cell.setup(viewModel: viewModel.availableNowCellViewModels[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionBirthday {
            performSegue(withIdentifier: Constant.SegueID.GOTO_BIRTHDAY_VILLAGER, sender: self)
        } else if collectionView == collectionAvailable {
            switch indexPath.row {
            case 0:
                performSegue(withIdentifier: Constant.SegueID.GOTO_FISHES, sender: self)
                break
            case 1:
                performSegue(withIdentifier: Constant.SegueID.GOTO_SEA_CREATURES, sender: self)
                break
            case 2:
                performSegue(withIdentifier: Constant.SegueID.GOTO_BUGS, sender: self)
                break
            default:
                break
            }
        }
    }
    
}
