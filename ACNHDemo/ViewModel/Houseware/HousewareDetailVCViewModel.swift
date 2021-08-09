//
//  HousewareDetailVCViewModel.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/8/9.
//
//

import UIKit

class HousewareDetailVCViewModel {

    var villagerDetailCellViewModels: [VillagerDetailCellViewModel] = []
    var onRequestEnd:(() -> Void)?

    func parseHousewaresDetail(houseware: Houseware) {
        var arrayDetailItem: [TitleContentPair] = []
        if houseware.buyPrice != nil {
            arrayDetailItem.append(TitleContentPair(title: "Buy Price", content: String(houseware.buyPrice ?? 0)))
        }
        arrayDetailItem.append(TitleContentPair(title: "Sell Price", content: String(houseware.sellPrice)))
        arrayDetailItem.append(TitleContentPair(title: "Tag", content: houseware.tag.rawValue))
        arrayDetailItem.append(TitleContentPair(title: "Size", content: houseware.size.rawValue))
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
