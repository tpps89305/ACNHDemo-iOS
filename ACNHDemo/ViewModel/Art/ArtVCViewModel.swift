//
//  ArtVCViewModel.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/16.
//

import UIKit

class ArtVCViewModel: NSObject {
    
    var arrayArtValues = Array<ArtValue>()
    var artCellViewModels: [ArtCellViewModel] = []
    var searchResult = [ArtValue]() {
        didSet {
            artCellViewModels.removeAll()
            convertToViewModel(artValues: searchResult)
        }
    }
    var onRequestEnd:(() -> Void)?
    var searchText: String = "" {
        didSet {
            if searchText == "" {
                // Exit search mode
                artCellViewModels.removeAll()
                convertToViewModel(artValues: arrayArtValues)
            } else {
                // Enter search mode
                searchArt(with: searchText)
            }
        }
    }
    
    func getArt() {
        ACNHProvider.request(.art(ardId: 0)) { (result) in
            do {
                let response = try result.get()
                let art = try ACNHJSONDecoder().decode(Art.self, from: response.data)
                for eachKey in art.keys {
                    self.arrayArtValues.append(art[eachKey]!)
                }
                
                self.arrayArtValues.sort { (artValue0, artValue1) -> Bool in
                    artValue0.id < artValue1.id
                }
                self.convertToViewModel(artValues: self.arrayArtValues)
                print("Done!")
            } catch {
                print("Error!")
            }
        }
    }
    
    func searchArt(with name: String) {
        searchResult = arrayArtValues.filter({ (bug) -> Bool in
            bug.name.nameTWzh.contains(name)
        })
    }
    
    private func convertToViewModel(artValues: [ArtValue]) {
        for artValue in artValues {
            let artCellViewModel = ArtCellViewModel(artValue: artValue)
            artCellViewModels.append(artCellViewModel)
        }
        onRequestEnd!()
    }

}
