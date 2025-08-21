//
//  ForecastCardView.swift
//  ToDoList
//
//  Created by Nathi Mabena on 2025/08/12.
//

import SwiftUI

struct ForecastCardRow: View {
    var body: some View {
        VStack(alignment: .leading) {
//            Text("Today")
//                .font(.headline)
//                .padding(.leading, 15)
            
            HStack(spacing: 10) {
                ForEach(["Today", "Tomorrow", "Wed"], id: \.self) { day in
                    VStack(spacing: 10) {
                        Text(day == "Today" ? "Today" : day == "Tomorrow" ? "Tue" : "Wed")
                            .bold()
                        Text(day == "Today" ? "23°C" : day == "Tomorrow" ? "22°C" : "20°C")
                            .bold()
                        Image(systemName: day == "Today" ? "cloud.rain.fill" : day == "Tomorrow" ? "sun.max.fill" : "sun.max.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 20)
                    .background(Color(.systemGray6).opacity(0.4))
                    .cornerRadius(20)
                }
            }
            .padding(.horizontal)
        }
        .padding(.top, 10)
    }
}

struct ForecastCardRow_Previews: PreviewProvider {
    static var previews: some View {
        ForecastCardRow()
    }
}
