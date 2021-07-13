//
//  SongsVCViewModel.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/13.
//

import UIKit

class SongsVCViewModel: NSObject {
    
    var arraySongs = Array<Song>()
    var songCellViewModels: [SongCellViewModel] = []
    var searchReslut = [Song]() {
        didSet {
            self.songCellViewModels.removeAll()
            self.convertToViewModel(songs: self.searchReslut)
        }
    }
    var onRequestEnd:(() -> Void)?
    var searchText: String = "" {
        didSet {
            if searchText == "" {
                // Exit search mode
                self.songCellViewModels.removeAll()
                self.convertToViewModel(songs: self.arraySongs)
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
                    return song0.fileName < song1.fileName
                }
                self.convertToViewModel(songs: self.arraySongs)
                print("Done!")
            } catch {
                print("Error!")
            }
        }
    }
    
    func searchSongs(with name: String) {
        searchReslut = arraySongs.filter({ (song) -> Bool in
            return song.name.nameTWzh.contains(name)
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
