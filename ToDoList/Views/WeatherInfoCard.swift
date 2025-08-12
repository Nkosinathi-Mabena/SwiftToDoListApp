//
//  WeatherInfoCard.swift
//  ToDoList
//
//  Created by Nathi Mabena on 2025/08/12.
//

import SwiftUI

struct WeatherInfoCard: View {
    var location: String
    var icon: String
    var temperature: String
    var description: String
    var date: String
    
    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 5) {
                Image(systemName: "mappin.and.ellipse")
                    .font(.system(size: 30))
                
                Text(location)
                    .font(.title)
                    .bold()
            }
            .padding()
            
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(height: UIScreen.main.bounds.height * 0.2)
            
            Text(temperature)
                .font(.system(size: 50))
                .bold()
            
            Text(description)
                .font(.title2)
            
            Text(date)
                .font(.subheadline)
        }
    }
}
