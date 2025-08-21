//
//  APIConfig.swift
//  ToDoList
//
//  Created by Nathi Mabena on 2025/08/20.
//

import Foundation

struct APIConfig{
    static var apiKey: String {
        guard let key = Bundle.main.object(forInfoDictionaryKey: "WEATHER_API_KEY") as? String else{
            fatalError("API key not set in Build Settings")
        }
        return key
    }
}
