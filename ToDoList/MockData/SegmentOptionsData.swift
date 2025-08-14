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
        case "Tasks": return ["Incompleted", "Completed"]
        case "priority": return ["Low", "Medium", "High"]
        case "Over Due": return ["Over Due"]
        case "Today": return ["Today's Tasks"]
        default: return []
        }
    }
}
