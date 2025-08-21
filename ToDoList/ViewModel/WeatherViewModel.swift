//
//  WeatherViewModel.swift
//  ToDoList
//
//  Created by Nathi Mabena on 2025/08/21.
//

import Foundation

@MainActor
final class WeatherViewModel: ObservableObject {
    @Published var currentWeather: Weather?
    @Published var forecast: [Forecast] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let repository: WeatherRepositoryProtocol
    
    init(repository: WeatherRepositoryProtocol) {
        self.repository = repository
    }
    
    func loadWeather(lat: Double, lon: Double) async {
        isLoading = true
        errorMessage = nil
        do {
            async let current = repository.fetchCurrentWeather(lat: lat, lon: lon)
            async let forecastData = repository.fetchForecast(lat: lat, lon: lon)

            let (currentResult, forecastResult) = try await (current, forecastData)

            self.currentWeather = currentResult
            self.forecast = forecastResult
        } catch {
            self.errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
