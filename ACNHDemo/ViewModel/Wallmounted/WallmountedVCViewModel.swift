//
// Created by 楊朝富 on 2021/8/9.
//

import Foundation

class WallmountedVCViewModel {

    var arrayWallmounted = Array<Wallmounted>()
    var wallmountedCellViewModels: [WallmountedCellViewModel] = []
    var searchResult = [Wallmounted]() {
        didSet {
            wallmountedCellViewModels.removeAll()
            convertToViewModel(wallmounteds: searchResult)
        }
    }
    var onRequestEnd:(() -> Void)?
    var searchText: String = "" {
        didSet {
            if searchText == "" {
                wallmountedCellViewModels.removeAll()
                convertToViewModel(wallmounteds: arrayWallmounted)
            } else {
                searchWallmounted(with: searchText)
            }
        }
    }

    func getWallmounted() {
        ACNHProvider.request(.wallmounted(wallmountedId: 0)) { result in
            do {
                let response = try result.get()
                let wallmounteds = try ACNHJSONDecoder().decode(Wallmounteds.self, from: response.data)
                for eachKey in wallmounteds.keys {
                    self.arrayWallmounted.append(wallmounteds[eachKey]![0])
                }
                self.arrayWallmounted.sort { wallmounted, wallmounted2 in
                    wallmounted.internalID < wallmounted2.internalID
                }
                self.convertToViewModel(wallmounteds: self.arrayWallmounted)
                print("Success to get wallmounted!")
            } catch {
                print("Error when get wallmounted...")
            }
        }
    }

    func searchWallmounted(with name: String) {
        searchResult = arrayWallmounted.filter { wallmounted in
            wallmounted.name.nameTWzh.contains(name)
        }
    }

    private func convertToViewModel(wallmounteds: [Wallmounted]) {
        for wallmounted in wallmounteds {
            let wallmountedCellModel = WallmountedCellViewModel(wallmounted: wallmounted)
            wallmountedCellViewModels.append(wallmountedCellModel)
        }
        onRequestEnd!()
    }

}
