//
//  VillagerVCViewModel.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/12.
//

import UIKit

class VillagerVCViewModel: NSObject {
    
    var arrayVillagers = Array<Villager>()
    var villagerCellViewModels: [VillagerCellViewModel] = []
    var searchReslut = [Villager]() {
        didSet {
            DispatchQueue.main.async {
                self.villagerCellViewModels.removeAll()
                self.convertToViewModel(villagers: self.searchReslut)
            }
        }
    }
    var onRequestEnd:(() -> Void)?
    var searchText: String = "" {
        didSet {
            if searchText == "" {
                // Exit search mode
                self.villagerCellViewModels.removeAll()
                self.convertToViewModel(villagers: self.arrayVillagers)
            } else {
                // Enter search mode
                searchVillagers(with: searchText)
            }
        }
    }
    
    func getVillagers() {
        ACNHProvider.request(.villagers(villagerId: 0)) { result in
            do {
                let response = try result.get()
                let villagers = try ACNHJSONDecoder().decode(Villagers.self, from: response.data)
                for eachKey in villagers.keys {
                    self.arrayVillagers.append(villagers[eachKey]!)
                }
                
                // Sort to get same order array every time(s).
                self.arrayVillagers.sort { (villager0, villager1) -> Bool in
                    return villager0.fileName < villager1.fileName
                }
                self.convertToViewModel(villagers: self.arrayVillagers)
                print("Done!")
            } catch {
                print("Error!")
            }
        }
    }
    
    func searchVillagers(with name: String) {
        searchReslut = arrayVillagers.filter({ (villager) -> Bool in
            return villager.name.nameTWzh.contains(name)
        })
    }
    
    private func convertToViewModel(villagers: [Villager]) {
        for villager in villagers {
            let villagerCellViewModel = VillagerCellViewModel(villager: villager)
            villagerCellViewModels.append(villagerCellViewModel)
        }
        onRequestEnd!()
    }
}
