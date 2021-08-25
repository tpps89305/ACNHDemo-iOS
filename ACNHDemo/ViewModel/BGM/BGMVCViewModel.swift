//
//  BGMVCViewModel.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/16.
//

import UIKit

class BGMVCViewModel: NSObject {
    
    var arrayBGMs = Array<BGM>()
    var onRequestEnd:(() -> Void)?
    
    func getBGMs() {
        ACNHProvider.request(.backgroundmusic(bgmId: 0)) { (result) in
            do {
                let response = try result.get()
                let bgms = try ACNHJSONDecoder().decode(Bgms.self, from: response.data)
                for eachKey in bgms.keys {
                    self.arrayBGMs.append(bgms[eachKey]!)
                }
                
                // Sort to get same order array every time(s).
                self.arrayBGMs.sort { (bgm0, bgm1) -> Bool in
                    bgm0.id < bgm1.id
                }
                self.onRequestEnd!()
                print("Success to get BGMs!")
            } catch {
                print("Error when get BGMs...")
            }
        }
    }
    
    func getBGMUrl(hour: String, weather: String) -> String {
        let intHour = Int(hour) ?? 0
        let fileHour = String(format: "%02d", arguments: [intHour])
        let result = arrayBGMs.filter { (bgm) -> Bool in
            bgm.fileName.contains(fileHour) && bgm.fileName.contains(weather)
        }
        if result.isEmpty {
            return ""
        }
        return result[0].musicURI
    }

}
