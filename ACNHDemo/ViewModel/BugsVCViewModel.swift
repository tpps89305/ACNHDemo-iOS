//
//  BugsVCViewModel.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/15.
//

import UIKit

class BugsVCViewModel: NSObject {
    
    var arrayBugs = Array<Bug>()
    var bugCellViewModels: [BugCellViewModel] = []
    var searchResult = [Bug]() {
        didSet {
            self.bugCellViewModels.removeAll()
            self.convertToViewModel(bugs: self.searchResult)
        }
    }
    var onRequestEnd:(() -> Void)?
    var searchText: String = "" {
        didSet {
            if searchText == "" {
                // Exit search mode
                self.bugCellViewModels.removeAll()
                self.convertToViewModel(bugs: self.arrayBugs)
            } else {
                // Enter search mode
                searchBugs(with: searchText)
            }
        }
    }
    
    func getBugs() {
        ACNHProvider.request(.bugs(bugId: 0)) { result in
            do {
                let response = try result.get()
                let bugs = try ACNHJSONDecoder().decode(Bugs.self, from: response.data)
                for eachKey in bugs.keys {
                    self.arrayBugs.append(bugs[eachKey]!)
                }
                
                // Sort to get same order array every time(s).
                self.arrayBugs.sort { (bug0, bug1) -> Bool in
                    return bug0.id < bug1.id
                }
                self.convertToViewModel(bugs: self.arrayBugs)
                print("Done!")
            } catch {
                print("Error!")
            }
        }
    }
    
    func searchBugs(with name: String) {
        searchResult = arrayBugs.filter({ (bug) -> Bool in
            return bug.name.nameTWzh.contains(name)
        })
    }
    
    private func convertToViewModel(bugs: [Bug]) {
        for bug in bugs {
            let bugCellViewModel =
            BugCellViewModel(bug: bug)
            bugCellViewModels.append(bugCellViewModel)
        }
        onRequestEnd!()
    }

}
