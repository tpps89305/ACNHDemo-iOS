//
// Created by 楊朝富 on 2021/8/10.
//

import Foundation

class DashboardVCViewModel {

    var arrayWeekday = ["日", "一", "二", "三", "四", "五", "六"]

    func getTodayInfo() -> String {
        let today = Date()
        let dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: today)
        let weekday = dateComponents.weekdayOrdinal!
        let month = dateComponents.month!
        let day = dateComponents.day!

        let result = "\(month) 月 \(day) 日 星期\(arrayWeekday[weekday])"
        print("Dashboard: \(result)")
        return result
    }

}
