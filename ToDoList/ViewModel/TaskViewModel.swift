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

}
