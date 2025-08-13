//
//  AddTaskSheet.swift
//  ToDoList
//
//  Created by Nathi Mabena on 2025/08/11.
//

import SwiftUI

struct AddTaskSheetView: View {
    @Binding var taskDescription: String
    @Binding var taskDate: Date
    @Binding var taskPriority: String
    @Binding var reminderEnabled: Bool
    var onSave: () -> Void
    
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
                Text("Low").tag("Low")
                Text("Medium").tag("Medium")
                Text("High").tag("High")
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            
            Toggle("Set Reminder", isOn: $reminderEnabled)
            
            Button("Save Task") {
                onSave()
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .padding()
        .presentationDetents([.medium])
    }
}
