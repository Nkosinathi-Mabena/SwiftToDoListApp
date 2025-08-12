//
//  SegmentOptionsData.swift
//  ToDoList
//
//  Created by Nathi Mabena on 2025/08/10.
//

import Foundation

struct SegmentOptionsData {
    static func getOptions(for card: String?) -> [String] {
        switch card {
        case "Tasks": return ["Complete", "Incomplete"]
        case "priority": return ["Low", "Medium", "High"]
        case "Reminders": return ["Marked for Reminder"]
        case "Today": return ["Today’s Tasks"]
        default: return []
        }
    }
}
