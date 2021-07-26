//
//  HousewaresVCViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/19.
//

import UIKit

class HousewaresVCViewModel: NSObject {

    var arrayHousewares = Array<Houseware>()
    var housewareCellViewModels: [HousewareCellViewModel] = []
    var searchResult = [Houseware]() {
        didSet {
            housewareCellViewModels.removeAll()
            convertToViewModel(housewares: searchResult)
        }
    }
    var onRequestEnd:(() -> Void)?
    var searchText: String = "" {
        didSet {
            if searchText == "" {
                // Exit search mode
                housewareCellViewModels.removeAll()
                convertToViewModel(housewares: arrayHousewares)
            } else {
                // Enter search mode
                searchHousewares(with: searchText)
            }
        }
    }
    
    func getHousewares() {
        ACNHProvider.request(.houseware(housewareId: 0)) { result in
            do {
                let response = try result.get()
                let housewares = try ACNHJSONDecoder().decode(Housewares.self, from: response.data)
                for eachKey in housewares.keys {
                    self.arrayHousewares.append(housewares[eachKey]![0])
                }
                self.arrayHousewares.sort { (houseware0, houseware1) -> Bool in
                    houseware0.internalID < houseware1.internalID
                }
                self.convertToViewModel(housewares: self.arrayHousewares)
            } catch {
                print("Error!")
            }
        }
    }
    
    func searchHousewares(with name: String) {
        searchResult = arrayHousewares.filter({ (houseware) -> Bool in
            houseware.name.nameTWzh.contains(name)
        })
    }
    
    private func convertToViewModel(housewares: [Houseware]) {
        for houseware in housewares {
            let housewareCellModel = HousewareCellViewModel(houseware: houseware)
            housewareCellViewModels.append(housewareCellModel)
        }
        onRequestEnd!()
    }
    
}
