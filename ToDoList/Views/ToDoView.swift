//
//  ToDoList.swift
//  ToDoList
//
//  Created by Nathi Mabena on 2025/08/08.
//

import SwiftUI

struct ToDoView: View {
    
    @StateObject private var viewModel:TaskViewModel
    @State private var selectedCard: CardType? = .tasks
    @State private var selectedSegment: String = "Incompleted"
    @State private var isTaskChecked = false
    @State private var showAddTaskSheet = false
    @State var selectedTask: Task?
    
    init(repository: TaskRepositoryProtocol) {
            _viewModel = StateObject(wrappedValue: TaskViewModel(repository: repository)) // this will create the viewmodel and pass the repository it received 
        }
            
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
                    SegmentsCard(icon: "house.fill", title: "All Task", count: viewModel.taskCount(cardCount: .tasks))
                        .onTapGesture { selectedCard = .tasks; selectedSegment = "Incompleted" }

                    SegmentsCard(icon: "exclamationmark.triangle.fill", title: "priority", count: viewModel.taskCount(cardCount: .priority))
                        .onTapGesture { selectedCard = .priority; selectedSegment = "Low" }


                }
                HStack(spacing: 15) {
                    SegmentsCard(icon: "hourglass.bottomhalf.fill", title: "Today", count: viewModel.taskCount(cardCount: .today))
                        .onTapGesture { selectedCard = .today; selectedSegment = "Today's Tasks" }

                    SegmentsCard(icon: "flag.fill", title: "Over Due", count: viewModel.taskCount(cardCount: .overdue))
                        .onTapGesture { selectedCard = .overdue; selectedSegment = "Over Due" }
                }
            }
            .navigationTitle("Segments")
            
            Text("Tasks")
                .font(.largeTitle)
                .bold()
                .frame(alignment: .leading)
            
            if let selectedCard, !selectedCard.options.isEmpty{
                Picker("Select", selection: $selectedSegment){
                    ForEach(selectedCard.options, id: \.self){ option in // id: \.self provides key path since cardType doesn't conform to Identifialble
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
        ToDoView(repository: TaskRepository())
    }
}

