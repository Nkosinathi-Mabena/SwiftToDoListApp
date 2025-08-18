//
//  ContentView.swift
//  ToDoList
//
//  Created by Nathi Mabena on 2025/08/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ToDoView(repository: TaskRepository())
    }
}

#Preview {
    ContentView()
}
