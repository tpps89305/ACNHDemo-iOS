//
//  FossilsVCViewModel.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/16.
//

import UIKit

class FossilsVCViewModel: NSObject {

    var arrayFossils = Array<Fossil>()
    var fossilCellViewModels: [FossilCellViewModel] = []
    var searchResult = [Fossil]() {
        didSet {
            fossilCellViewModels.removeAll()
            convertToViewModel(fossils: searchResult)
        }
    }
    var onRequestEnd:(() -> Void)?
    var searchText: String = "" {
        didSet {
            if searchText == "" {
                // Exit search mode
                fossilCellViewModels.removeAll()
                convertToViewModel(fossils: arrayFossils)
            } else {
                // Enter search mode
                searchFossils(with: searchText)
            }
        }
    }
    
    func getFossils() {
        ACNHProvider.request(.fossils(fossilId: 0)) { (result) in
            do {
                let response = try result.get()
                let fossils = try ACNHJSONDecoder().decode(Fossils.self, from: response.data)
                for eachKey in fossils.keys {
                    self.arrayFossils.append(fossils[eachKey]!)
                }
                
                self.arrayFossils.sort { (fossil0, fossil1) -> Bool in
                    fossil0.fileName < fossil1.fileName
                }
                self.convertToViewModel(fossils: self.arrayFossils)
                print("Success to get fossils!")
            } catch {
                print("Error when get fossils...")
            }
        }
    }
    
    func searchFossils(with name: String) {
        searchResult = arrayFossils.filter({ (bug) -> Bool in
            bug.name.nameTWzh.contains(name)
        })
    }
    
    private func convertToViewModel(fossils: [Fossil]) {
        for fossil in fossils {
            let fossilCellViewModel = FossilCellViewModel(fossil: fossil)
            fossilCellViewModels.append(fossilCellViewModel)
        }
        onRequestEnd!()
    }
    
}
