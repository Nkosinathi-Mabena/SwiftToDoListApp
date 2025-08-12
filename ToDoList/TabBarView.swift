//
//  TabBarView.swift
//  ToDoList
//
//  Created by Nathi Mabena on 2025/08/11.
//

import SwiftUI

struct TabBarView: View{
    @State private var selectedTab = 0
    
    var body: some View{
        TabView(selection: $selectedTab){
            ToDoView()
                .tabItem{
                    Image(systemName: "doc.plaintext")
                    Text("Tasks")
                }
                .onAppear{selectedTab = 0}
                .tag(0)
            
            WeatherView()
                .tabItem{
                    Image(systemName: "cloud.drizzle.fill")
                    Text("Weather")
                }
                .onAppear{selectedTab = 1}
                .tag(1)
            
        }
    }
}

#Preview {
    TabBarView()
}
