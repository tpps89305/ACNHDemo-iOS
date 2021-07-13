//
//  SongCellViewModel.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/13.
//

import UIKit

class SongCellViewModel: NSObject {
    var song: Song

    init(song: Song) {
        self.song = song
    }
}
