//
//  BGMViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/16.
//

import UIKit
import AVFoundation

class BGMViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var pickerTimeWeather: UIPickerView!
    @IBOutlet weak var btnPlay: UIButton!
    
    let arrayHours = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"]
    let arrayWeathers = [Weather.rainy, Weather.snowy, Weather.sunny]
    let viewModel = BGMVCViewModel()
    
    var selectedHour = "0"
    var selectedWeather = Weather.rainy.rawValue
    var player = AVPlayer.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bindViewModel()
        viewModel.getBGMs()
    }
    
    func bindViewModel() {
        viewModel.onRequestEnd = { [weak self] in
            DispatchQueue.main.async {
                self?.btnPlay.isEnabled = true
            }
        }
    }
    
    @IBAction func btnPlayPress(_ sender: UIButton) {
        let musicUrl = viewModel.getBGMUrl(hour: selectedHour, weather: selectedWeather)
        print("BGM's Url: \(musicUrl)")
        player.replaceCurrentItem(with: AVPlayerItem(url: URL(string: musicUrl)!))
        player.play()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return arrayHours.count
        case 1:
            return arrayWeathers.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return arrayHours[row]
        case 1:
            return arrayWeathers[row].rawValue
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            selectedHour = arrayHours[row]
        case 1:
            selectedWeather = arrayWeathers[row].rawValue
        default:
            break
        }
    }

}
