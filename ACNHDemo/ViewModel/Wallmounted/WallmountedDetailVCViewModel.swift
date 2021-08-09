//
// Created by 楊朝富 on 2021/8/9.
//

import Foundation

class WallmountedDetailVCViewModel {

    var villagerDetailCellViewModels: [VillagerDetailCellViewModel] = []
    var onRequestEnd:(() -> Void)?

    func parseWallmountedDetail(wallmounted: Wallmounted) {
        var arrayDetailItem: [TitleContentPair] = []
        if wallmounted.buyPrice != nil {
            arrayDetailItem.append(TitleContentPair(title: "Buy Price", content: String(wallmounted.buyPrice ?? 0)))
        }
        arrayDetailItem.append(TitleContentPair(title: "Sell Price", content: String(wallmounted.sellPrice)))
        arrayDetailItem.append(TitleContentPair(title: "Tag", content: wallmounted.tag))
        arrayDetailItem.append(TitleContentPair(title: "Size", content: wallmounted.size.rawValue))
        convertToViewModel(arrayDetailItem: arrayDetailItem)
    }

    private func convertToViewModel(arrayDetailItem: [TitleContentPair]) {
        for eachPair in arrayDetailItem {
            let villagerDetailCellViewModel = VillagerDetailCellViewModel(titleContentPair: eachPair)
            villagerDetailCellViewModels.append(villagerDetailCellViewModel)
        }
        onRequestEnd!()
    }
}
