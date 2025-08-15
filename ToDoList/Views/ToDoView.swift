//
//  ToDoList.swift
//  ToDoList
//
//  Created by Nathi Mabena on 2025/08/08.
//

import SwiftUI

struct ToDoView: View {
    
    @StateObject private var viewModel = TaskViewModel()
    @State private var selectedCard: String? = "Tasks"
    @State private var selectedSegment: String = "Incompleted"
    @State private var isTaskChecked = false
    @State private var showAddTaskSheet = false
    @State var selectedTask: Task?
            
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {

           HStack {
                Text("Segments")
                    .font(.largeTitle)
                    .bold()
                Spacer()
               Button {
                   showAddTaskSheet = true
                   selectedTask = nil
               } label: {
                   Image(systemName: "plus")
                       .font(.title2)
               }
            }
            
                VStack(spacing: 15) {
                HStack(spacing: 15) {
                    SegmentsCard(icon: "house.fill", title: "All Task", count: viewModel.taskCount(cardCount: "Tasks"))
                        .onTapGesture { selectedCard = "Tasks"
                            selectedSegment = "Incompleted" }
                    SegmentsCard(icon: "exclamationmark.triangle.fill", title: "priority", count: viewModel.taskCount(cardCount: "priority"))
                        .onTapGesture { selectedCard = "priority"
                            selectedSegment = "Low"}

                }
                HStack(spacing: 15) {
                    SegmentsCard(icon: "hourglass.bottomhalf.fill", title: "Today", count: viewModel.taskCount(cardCount:"Today"))
                        .onTapGesture { selectedCard = "Today"
                            selectedSegment = "Today's Tasks"}
                    SegmentsCard(icon: "flag.fill", title: "Over Due", count: viewModel.taskCount(cardCount:"Over Due"))
                        .onTapGesture { selectedCard = "Over Due"
                            selectedSegment = "Over Due"}
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
                        ForEach(viewModel.filteredTasks(selectedCard: selectedCard, selectedSegment: selectedSegment)) { task in
                            TaskCardView(task: task, viewModel: viewModel)
                                .onTapGesture{
                                    selectedTask = task
                                }
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
                  AddTaskSheetView(viewModel: viewModel)
              }
        .sheet(item: $selectedTask) { task in // now selectedTask is a trigger
            AddTaskSheetView(viewModel: viewModel, taskToEdit: task)
        }
    }
}

struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView()
    }
}

