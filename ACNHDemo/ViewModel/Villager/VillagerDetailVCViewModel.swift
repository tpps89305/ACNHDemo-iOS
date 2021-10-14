//
// Created by 楊朝富 on 2021/7/30.
//

import Foundation

class VillagerDetailVCViewModel {

    var villagerAvatarCellViewModel = VillagerAvatarCellViewModel(imageUri: "")
    var villagerDetailCellViewModels: [VillagerDetailCellViewModel] = []
    var onRequestEnd:(() -> Void)?

    func parseVillagerDetail(villager: Villager) {
        var arrayDetailItem: [TitleContentPair] = []
        arrayDetailItem.append(TitleContentPair(title: "Personality", content: villager.personality.rawValue))
        arrayDetailItem.append(TitleContentPair(title: "Birthday", content: villager.birthday))
        arrayDetailItem.append(TitleContentPair(title: "Like", content: villager.birthday))
        arrayDetailItem.append(TitleContentPair(title: "Species", content: villager.species))
        arrayDetailItem.append(TitleContentPair(title: "Gender", content: villager.gender.rawValue))
        arrayDetailItem.append(TitleContentPair(title: "Catch phrase", content: villager.catchPhrase))
        convertToViewModel(arrayDetailItem: arrayDetailItem, textColor: villager.textColor, bubbleColor: villager.bubbleColor)
        convertToViewModel(imageUrl: villager.imageURI)
    }

    private func convertToViewModel(arrayDetailItem: [TitleContentPair], textColor: String, bubbleColor: String) {
        for eachPair in arrayDetailItem {
            let villagerDetailCellViewModel = VillagerDetailCellViewModel(titleContentPair: eachPair, textColor: textColor, bubbleColor: bubbleColor)
            villagerDetailCellViewModels.append(villagerDetailCellViewModel)
        }
        onRequestEnd!()
    }

    private func convertToViewModel(imageUrl: String) {
        villagerAvatarCellViewModel = VillagerAvatarCellViewModel(imageUri: imageUrl)
        onRequestEnd!()
    }

}
