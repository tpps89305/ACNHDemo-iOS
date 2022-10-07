//
//  EditTaskViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/12/21.
//

import UIKit

class EditTaskViewController: UIViewController {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var fieldTaskName: UITextField!
    @IBOutlet weak var fieldCurrentValue: UITextField!
    @IBOutlet weak var fieldMaxValue: UITextField!
    
    let viewModel = EditTaskViewModel()
    var notifySavedDelegate:(() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        labelTitle.text = viewModel.dailyTask?.name
        fieldTaskName.text = viewModel.dailyTask?.name
        fieldCurrentValue.text = String(viewModel.dailyTask?.currentValue ?? 0)
        fieldMaxValue.text = String(viewModel.dailyTask?.maxValue ?? 0)
    }
    
    @IBAction func buttonDonePress(_ sender: UIButton) {
        viewModel.dailyTask?.name = fieldTaskName.text
        viewModel.dailyTask?.currentValue = Int32(fieldCurrentValue.text ?? "") ?? 0
        viewModel.dailyTask?.maxValue = Int32(fieldMaxValue.text ?? "") ?? 0
        CoreDataHandler.updateDailyTask(dailyTask: viewModel.dailyTask!)
        notifySavedDelegate!()
        dismiss(animated: true)
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
