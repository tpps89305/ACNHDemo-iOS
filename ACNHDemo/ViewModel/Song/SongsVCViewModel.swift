//
//  SongsVCViewModel.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/13.
//

import UIKit

class SongsVCViewModel: NSObject {
    
    var arraySongs = [Song]()
    var songCellViewModels: [SongCellViewModel] = []
    var searchResult = [Song]() {
        didSet {
            songCellViewModels.removeAll()
            convertToViewModel(songs: searchResult)
        }
    }
    var onRequestEnd:(() -> Void)?
    var searchText: String = "" {
        didSet {
            if searchText == "" {
                // Exit search mode
                songCellViewModels.removeAll()
                convertToViewModel(songs: arraySongs)
            } else {
                // Enter search mode
                searchSongs(with: searchText)
            }
        }
    }
    
    func getSongs() {
        ACNHProvider.request(.songs(songId: 0)) { result in
            do {
                let response = try result.get()
                let songs = try ACNHJSONDecoder().decode(Songs.self, from: response.data)
                for eachKey in songs.keys {
                    self.arraySongs.append(songs[eachKey]!)
                }
                
                // Sort to get same order array every time(s).
                self.arraySongs.sort { (song0, song1) -> Bool in
                    song0.fileName < song1.fileName
                }
                self.convertToViewModel(songs: self.arraySongs)
                print("Success to get songs!")
            } catch {
                print("Error when get songs...")
            }
        }
    }
    
    func searchSongs(with name: String) {
        searchResult = arraySongs.filter({ (song) -> Bool in
            song.name.nameTWzh.contains(name)
        })
    }
    
    private func convertToViewModel(songs: [Song]) {
        for song in songs {
            let songCellModel = SongCellViewModel(song: song)
            songCellViewModels.append(songCellModel)
        }
        onRequestEnd!()
    }

}
