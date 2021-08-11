//
// Created by 楊朝富 on 2021/7/30.
//

import Foundation

class VillagerDetailCellViewModel {
    var titleContentPair: TitleContentPair
    var textColor: String?
    var bubbleColor: String?

    init(titleContentPair: TitleContentPair, textColor: String, bubbleColor: String) {
        self.titleContentPair = titleContentPair
        self.textColor = textColor
        self.bubbleColor = bubbleColor
    }

    init(titleContentPair: TitleContentPair) {
        self.titleContentPair = titleContentPair
    }
}