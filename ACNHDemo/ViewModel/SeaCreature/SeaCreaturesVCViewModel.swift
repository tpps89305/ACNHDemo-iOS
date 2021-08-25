//
//  SeaCreaturesVCViewModel.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/15.
//

import UIKit

class SeaCreaturesVCViewModel: NSObject {

    var arraySeaCreatures = Array<SeaCreature>()
    var seaCreatureCellViewModels: [SeaCreatureCellViewModel] = []
    var searchResult = [SeaCreature]() {
        didSet {
            seaCreatureCellViewModels.removeAll()
            convertToViewModel(seaCreatures: searchResult)
        }
    }
    var onRequestEnd:(() -> Void)?
    var searchText: String = "" {
        didSet {
            if searchText == "" {
                // Exit search mode
                seaCreatureCellViewModels.removeAll()
                convertToViewModel(seaCreatures: arraySeaCreatures)
            } else {
                // Enter search mode
                searchSeaCreatures(with: searchText)
            }
        }
    }
    
    func getSeaCreatures() {
        ACNHProvider.request(.seaCreatures(seaCreatureId: 0)) { result in
            do {
                let response = try result.get()
                let seaCreatures = try ACNHJSONDecoder().decode(SeaCreatures.self, from: response.data)
                for eachKey in seaCreatures.keys {
                    self.arraySeaCreatures.append(seaCreatures[eachKey]!)
                }
                
                // Sort to get same order array every time(s).
                self.arraySeaCreatures.sort { (seaCreature0, seaCreature1) -> Bool in
                    seaCreature0.id < seaCreature1.id
                }
                self.convertToViewModel(seaCreatures: self.arraySeaCreatures)
                print("Success to get sea creatures!")
            } catch {
                print("Error when get sea creatures...")
            }
        }
    }
    
    func searchSeaCreatures(with name: String) {
        searchResult = arraySeaCreatures.filter({ (seaCreature) -> Bool in
            seaCreature.name.nameTWzh.contains(name)
        })
    }
    
    private func convertToViewModel(seaCreatures: [SeaCreature]) {
        for seaCreature in seaCreatures {
            let seaCreatureCellViewModel = SeaCreatureCellViewModel(seaCreature: seaCreature)
            seaCreatureCellViewModels.append(seaCreatureCellViewModel)
        }
        onRequestEnd!()
    }
}
