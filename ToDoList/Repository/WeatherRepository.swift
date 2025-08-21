//
//  WeatherRepository.swift
//  ToDoList
//
//  Created by Nathi Mabena on 2025/08/20.
//

import Foundation
import CoreLocation

protocol WeatherRepositoryProtocol {
    func fetchCurrentWeather(lat: Double, lon: Double) async throws -> Weather
    func fetchForecast(lat: Double, lon: Double) async throws -> [Forecast]
}

final class WeatherRepository: WeatherRepositoryProtocol {
    
    private let baseURL = "https://api.weatherapi.com/v1"
    
    func fetchCurrentWeather(lat: Double, lon: Double) async throws -> Weather {
        let urlString = "\(baseURL)/current.json?key=\(APIConfig.apiKey)&q=\(lat),\(lon)&aqi=no"
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decoded = try decoder.decode(WeatherResponse.self, from: data)
    
        return decoded.toDomain()
    }
    
    func fetchForecast(lat: Double, lon: Double) async throws -> [Forecast] {
        let urlString = "\(baseURL)/forecast.json?key=\(APIConfig.apiKey)&q=\(lat),\(lon)&days=3&aqi=no&alerts=no"
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decoded = try decoder.decode(ForecastResponse.self, from: data)
        
        return decoded.toDomain()
    }
}
