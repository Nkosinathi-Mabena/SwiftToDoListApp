//
//  ForecastResponse.swift
//  ToDoList
//
//  Created by Nathi Mabena on 2025/08/20.
//

import Foundation

struct ForecastResponse: Codable { //Codeable = Serialization   
    let forecast: ForecastDays
    let location: Location
    
    struct Location: Codable {
        let name: String
    }
    
    struct ForecastDays: Codable {
        let forecastday: [ForecastItem]
    }
    
    struct ForecastItem: Codable {
        let date_epoch: TimeInterval
        let day: Day
        let astro: Astro
    }
    
    struct Day: Codable {
        let maxtemp_c: Double
        let mintemp_c: Double
        let avgtemp_c: Double
        let condition: Condition
    }
    
    struct Condition: Codable {
        let text: String
        let icon: String
    }
    
    struct Astro: Codable {
        let sunrise: String
        let sunset: String
    }
    
    func toDomain() -> [Forecast] {
        forecast.forecastday.map {
            Forecast(
                temperature: $0.day.avgtemp_c,
                description: $0.day.condition.text,
                date: Date(timeIntervalSince1970: $0.date_epoch),
                sunrise: parseTime($0.astro.sunrise),
                sunset: parseTime($0.astro.sunset),
                icon: $0.day.condition.icon
            )
        }
    }
    
    private func parseTime(_ time: String) -> Date { //convert date
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter.date(from: time) ?? Date()
    }
}


