//
// Created by 楊朝富 on 2021/7/30.
//

import Foundation

class VillagerDetailCellViewModel {
    var titleContentPair: TitleContentPair
    var textColor: String?

    init(titleContentPair: TitleContentPair, textColor: String) {
        self.titleContentPair = titleContentPair
        self.textColor = textColor
    }

    init(titleContentPair: TitleContentPair) {
        self.titleContentPair = titleContentPair
    }
}