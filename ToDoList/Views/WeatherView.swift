//
//  WeatherView.swift
//  ToDoList
//
//  Created by Nathi Mabena on 2025/08/12.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        VStack(spacing: 0) {
                VStack(spacing: 20) {
                    HStack(spacing: 5) {
                        Image(systemName: "location.fill")
                        
                        Text("Sandton")
                            .font(.title)
                            .bold()
                    }
                    .padding(.top, 20)
                    
                    Image(systemName: "sun.max.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: UIScreen.main.bounds.height * 0.2)
                    
                    Text("23°C")
                        .font(.system(size: 50))
                        .bold()
                    
                    Text("Sunny")
                        .font(.title2)
                    
                    Text("17 Aug 2025")
                        .font(.subheadline)
                }
               // .background(Color(.systemGray6))

            VStack(alignment: .leading) {
                Text("Today")
                    .font(.headline)
                    .padding(.leading, 15)
                
                HStack(spacing: 15) {
                    ForEach(["Today", "Tomorrow", "Friday"], id: \.self) { day in
                        VStack(spacing: 10) {
                            Text(day == "Today" ? "23°C" : day == "Tomorrow" ? "22°C" : "20°C")
                                .bold()
                            Image(systemName: day == "Friday" ? "cloud.rain.fill" : "sun.max.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 30)
                        }
                        .frame(height: 70)
                        .frame(width: 80)
                        .padding()
                        .cornerRadius(20)
                        .shadow(radius: 30)
                        .background(Color(.systemGray6))
                        
                    }
                }
                .padding(.horizontal)
            }
            .padding(.top, 10)
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        
            WeatherView()
        
    }
}


