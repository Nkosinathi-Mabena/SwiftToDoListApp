//
//  AddTaskSheet.swift
//  ToDoList
//
//  Created by Nathi Mabena on 2025/08/11.
//

import SwiftUI

struct AddTaskSheetView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: TaskViewModel
    
    @State private var taskDescription: String = ""
    @State private var taskDate: Date = Date()
    @State private var taskPriority: Priority = .low
    @State private var reminderEnabled: Bool = false
    
       
    var body: some View {
        VStack(spacing: 20) {
            Text("Add Task")
                .font(.title)
                .bold()
            
            TextField("Description", text: $taskDescription)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            DatePicker("Select Due Date", selection: $taskDate, displayedComponents: .date)
                .padding(.horizontal)
            
            Picker("Priority", selection: $taskPriority) {
                Text("Low").tag(Priority.low)
                Text("Medium").tag(Priority.medium)
                Text("High").tag(Priority.high)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            
            Toggle("Set Reminder", isOn: $reminderEnabled)
            
            Button("Save Task") {
                viewModel.addTask( description: taskDescription, dueDate: taskDate, priority: taskPriority, reminderEnabled: reminderEnabled)
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .padding()
        .presentationDetents([.medium])
    }
}
