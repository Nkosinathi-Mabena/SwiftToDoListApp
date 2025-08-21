//
//  Weather.swift
//  ToDoList
//
//  Created by Nathi Mabena on 2025/08/20.
//

import Foundation

struct Weather: Codable {
    let location: String
    let temperature: Double
    let description: String
    let date: Date
    let sunrise: Date
    let sunset: Date
    let icon: String
}

struct Forecast: Identifiable, Codable {
    let id = UUID()
    let temperature: Double
    let description: String
    let date: Date
    let sunrise: Date
    let sunset: Date
    let icon: String
    
    private enum CodingKeys: String, CodingKey{
        case date,temperature,icon,sunset,sunrise,description
    }
}
