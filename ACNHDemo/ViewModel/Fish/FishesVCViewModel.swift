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
    
    func getFishes() {
        ACNHProvider.request(.fishes(fishId: 0)) { result in
            do {
                let response = try result.get()
                let fishes = try ACNHJSONDecoder().decode(Fishes.self, from: response.data)
                for eachKey in fishes.keys {
                    self.arrayFishes.append(fishes[eachKey]!)
                }
                
                // Sort to get same order array every time(s).
                self.arrayFishes.sort { (fish0, fish1) -> Bool in
                    fish0.fileName < fish1.fileName
                }
                self.convertToViewModel(fishes: self.arrayFishes)
                print("Done!")
            } catch {
                print("Error!")
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
