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
            bugCellViewModels.removeAll()
            convertToViewModel(bugs: searchResult)
        }
    }
    var onRequestEnd:(() -> Void)?
    var searchText: String = "" {
        didSet {
            if searchText == "" {
                // Exit search mode
                bugCellViewModels.removeAll()
                convertToViewModel(bugs: arrayBugs)
            } else {
                // Enter search mode
                searchBugs(with: searchText)
            }
        }
    }
    
    func getBugs(availableTime: Bool) {
        ACNHProvider.request(.bugs(bugId: 0)) { result in
            do {
                let response = try result.get()
                let bugs = try ACNHJSONDecoder().decode(Bugs.self, from: response.data)
                for eachKey in bugs.keys {
                    self.arrayBugs.append(bugs[eachKey]!)
                }
                
                if availableTime {
                    let currentMonth = DateHandler.getCurrentMonth()
                    let currentHour = DateHandler.getCurrentHour()
                    self.arrayBugs = self.arrayBugs.filter { bug -> Bool in
                        if bug.availability.monthArrayNorthern.contains(currentMonth) || bug.availability.isAllYear {
                            if bug.availability.timeArray.contains(currentHour) || bug.availability.isAllDay {
                                return true
                            }
                        }
                        return false
                    }
                }
                
                // Sort to get same order array every time(s).
                self.arrayBugs.sort { (bug0, bug1) -> Bool in
                    bug0.id < bug1.id
                }
                self.convertToViewModel(bugs: self.arrayBugs)
                print("Success to get bugs!")
            } catch {
                print("Error when get bugs...")
            }
        }
    }
    
    func searchBugs(with name: String) {
        searchResult = arrayBugs.filter({ (bug) -> Bool in
            bug.name.nameTWzh.contains(name)
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
