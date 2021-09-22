//
//  FishesVCViewModel.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/13.
//

import UIKit

class FishesVCViewModel: NSObject {
    
    var arrayFishes = Array<Fish>()
    var fishCellViewModels: [FishCellViewModel] = []
    var searchResult = [Fish]() {
        didSet {
            fishCellViewModels.removeAll()
            convertToViewModel(fishes: searchResult)
        }
    }
    var onRequestEnd:(() -> Void)?
    var searchText: String = "" {
        didSet {
            if searchText == "" {
                // Exit search mode
                fishCellViewModels.removeAll()
                convertToViewModel(fishes: arrayFishes)
            } else {
                // Enter search mode
                searchFishes(with: searchText)
            }
        }
    }
    
    func getFishes(availableTime: Bool) {
        ACNHProvider.request(.fishes(fishId: 0)) { result in
            do {
                let response = try result.get()
                let fishes = try ACNHJSONDecoder().decode(Fishes.self, from: response.data)
                for eachKey in fishes.keys {
                    self.arrayFishes.append(fishes[eachKey]!)
                }
                
                if availableTime {
                    let currentMonth = DateHandler.getCurrentMonth()
                    let currentHour = DateHandler.getCurrentHour()
                    self.arrayFishes = self.arrayFishes.filter { fish -> Bool in
                        if fish.availability.monthArrayNorthern.contains(currentMonth) || fish.availability.isAllYear {
                            if fish.availability.timeArray.contains(currentHour) || fish.availability.isAllDay {
                                return true
                            }
                        }
                        return false
                    }
                }
                
                // Sort to get same order array every time(s).
                self.arrayFishes.sort { (fish0, fish1) -> Bool in
                    fish0.fileName < fish1.fileName
                }
                self.convertToViewModel(fishes: self.arrayFishes)
                print("Success to get fishes!")
            } catch {
                print("Error when get fishes...")
            }
        }
    }
    
    func searchFishes(with name: String) {
        searchResult = arrayFishes.filter({ (fish) -> Bool in
            fish.name.nameTWzh.contains(name)
        })
    }
    
    private func convertToViewModel(fishes: [Fish]) {
        for fish in fishes {
            let fishCellViewModel = FishCellViewModel(fish: fish)
            fishCellViewModels.append(fishCellViewModel)
        }
        onRequestEnd!()
    }

}
