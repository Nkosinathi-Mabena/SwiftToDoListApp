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
                   WeatherInfoCard(
                       location: "Johannesburg",
                       icon: "sun.max.fill",
                       temperature: "23°C",
                       description: "Sunny",
                       date: "17 Aug 2025"
                   )
                   
                   ForecastCardRow()
               }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
            WeatherView()
    }
}


