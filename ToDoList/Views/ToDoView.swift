//
//  ToDoList.swift
//  ToDoList
//
//  Created by Nathi Mabena on 2025/08/08.
//

import SwiftUI

struct ToDoView: View {
    
    @State private var selectedCard: String? = "Tasks"
    @State private var selectedSegment: String = ""
    @State private var isTaskChecked = false
    @State private var showAddTaskSheet = false
    @State private var taskDescription = ""
    @State private var taskDate = Date()
    @State private var taskPriority = "Low"

    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            

           HStack {
                Text("Segments")
                    .font(.largeTitle)
                    .bold()
                Spacer()
                Image(systemName: "plus")
                    .font(.title2)
                    .onTapGesture {showAddTaskSheet = true}
            }
            
            

            VStack(spacing: 15) {
                HStack(spacing: 15) {
                    ReminderCard(icon: "hourglass.bottomhalf.fill", title: "All Task", count: 2)
                        .onTapGesture { selectedCard = "Tasks" }
                    ReminderCard(icon: "exclamationmark.triangle.fill", title: "priority", count: 1)
                        .onTapGesture { selectedCard = "priority" }

                }
                HStack(spacing: 15) {
                    ReminderCard(icon: "house.fill", title: "Today", count: 2)
                        .onTapGesture { selectedCard = "Today" }
                    ReminderCard(icon: "heart.circle", title: "Reminders", count: 2)
                        .onTapGesture { selectedCard = "Reminders" }
                }
            }
            .navigationTitle("Segments")
            
            
            Text("Tasks")
                .font(.largeTitle)
                .bold()
                .frame(alignment: .leading)
            
            if !SegmentOptionsData.getOptions(for: selectedCard).isEmpty {
                Picker("Select", selection: $selectedSegment) {
                    ForEach(SegmentOptionsData.getOptions(for: selectedCard), id: \.self) { option in
                        Text(option).tag(option)
                    }
                }
                .pickerStyle(.segmented)
            }
            VStack {
                ScrollView {
                    LazyVStack(spacing: 13) {
                        ForEach(0..<10, id: \.self) { _ in
                            TaskCardView(priority: "High",date: "25 Sep 2025",description: "Work on Methodology for belgium campus", isCheck: $isTaskChecked)
                        }
                    }
                    .padding(.vertical)
                }
                .frame(maxHeight: 500)

            }
            //Spacer()
        }
        .padding()
        .sheet(isPresented: $showAddTaskSheet) {
            AddTaskSheetView(
                taskDescription: $taskDescription,
                taskDate: $taskDate,
                taskPriority: $taskPriority
            ) {
                showAddTaskSheet = false
            }
        }

        
    }
}


struct RemindersView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView()
    }
}

