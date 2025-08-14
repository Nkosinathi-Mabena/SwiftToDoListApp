//
//  TaskViewModel.swift
//  ToDoList
//
//  Created by Nathi Mabena on 2025/08/14.
//

import Foundation

final class TaskViewModel: ObservableObject {
    
    @Published var tasks: [Task] = [] //used to update UI when tasks are changed
    
    private let repository: TaskRepositoryProtocol
    
    init(repository: TaskRepositoryProtocol = TaskRepository()){
        self.repository = repository
        fetchTasks()
    }
    
    func addTask(description: String, dueDate: Date, priority: Priority,reminderEnabled: Bool){
        let newTask = Task(id: UUID(), description: description, dueDate: dueDate, priority: priority, reminderEnabled: reminderEnabled, isCompleted: false)
        repository.addTask(newTask)
        fetchTasks()
    }
    
    func fetchTasks(){
        tasks = repository.fetchTasks()
    }
    
    func updateTask(task: Task){
        repository.updateTask(task)
        fetchTasks()
    }
    
    func deleteTask(task:Task){
        repository.deleteTask(task)
        fetchTasks()
    }
    
    func toggleCompletion(task: Task) {
        var updatedTask = task
        updatedTask.isCompleted.toggle()
        updateTask(task: updatedTask)
    }
    
    func filteredTasks(selectedCard: String?, selectedSegment: String?) -> [Task] {
        switch selectedCard {
        case "Tasks":
            return tasks.filter {$0.isCompleted == (selectedSegment == "Completed") } //$0 shortcut rather than task in task.isCompleted
        case "priority":
            return tasks.filter { $0.priority.rawValue == selectedSegment }
        case "Over Due":
            return tasks.filter { !$0.isCompleted && $0.dueDate < Calendar.current.startOfDay(for: Date()) } // not Date() because that includes present day
        case "Today":
            return tasks.filter { Calendar.current.isDateInToday($0.dueDate) } // check if due date is current date today and returns true or false
        default:
            return []
        }
    }

    func taskCount (cardCount: String?) -> Int{
        switch cardCount{
        case "Tasks":
            return tasks.count
        case "priority":
            return tasks.count
        case "Today":
            return tasks.filter{Calendar.current.isDateInToday($0.dueDate)}.count
        case "Over Due":
            return tasks.filter{
                !$0.isCompleted && $0.dueDate < Calendar.current.startOfDay(for: Date())
            }.count
        default:
            return 0
        }
    }
}
