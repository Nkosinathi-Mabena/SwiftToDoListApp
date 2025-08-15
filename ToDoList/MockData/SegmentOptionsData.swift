//
//  SegmentOptionsData.swift
//  ToDoList
//
//  Created by Nathi Mabena on 2025/08/10.
//

enum CardType: String, CaseIterable {
    case tasks = "Tasks"
    case priority = "priority"
    case overdue = "Over Due"
    case today = "Today"
}

struct SegmentOptionsData {
    static func getOptions(for card: CardType?) -> [String] {
        switch card {
        case .tasks: return ["Incompleted", "Completed"]
        case .priority: return ["Low", "Medium", "High"]
        case .overdue: return ["Over Due"]
        case .today: return ["Today's Tasks"]
        case .none: return []
        }
    }
}

