//
//  WeatherManager.swift
//  Clima
//
//  Created by Kanishk Vijaywargiya on 05/11/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
    func didFailWithError(error: String)
}

struct WeatherManager {
    var delegate: WeatherManagerDelegate?
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=0322b0b712d32815754d25da03692629&units=metric"
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(urlString: urlString) { returnedData in
            parseJSON(returnedData)
        }
    }
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString) { returnedData in
            parseJSON(returnedData)
        }
    }
    
    func performRequest(urlString: String, completionHandler: @escaping(_ data: Data?) -> ()) {
        // 1 Create an URL
        guard let url = URL(string: urlString) else { return }
        //2 Create an URLSession & 3. Give an URLSession a Task & 4 Start the Task
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let data = data,
                error == nil,
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300
            else {
                print("Error downloading data")
                completionHandler(nil)
                delegate?.didFailWithError(error: "Error downloading data")
                return
            }
            completionHandler(data)
        }.resume()
    }
    
    func parseJSON(_ returnedData: Data?) {
        if let data = returnedData {
            print(String(data: data, encoding: .utf8)!)
            guard let decodedData = try? JSONDecoder().decode(WeatherData.self, from: data) else { return }
            let id = decodedData.weather[0].id
            let name = decodedData.name
            let temp = decodedData.main.temp
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            
            print(weather.temperatureString)
            print(weather.conditionName)
            delegate?.didUpdateWeather(weather: weather)
        } else {
            print("No Data returned")
            delegate?.didFailWithError(error: "No Data returned")
        }
    }
}

// API Key:- 0322b0b712d32815754d25da03692629
/*
 https://api.openweathermap.org/data/2.5/weather?appid=0322b0b712d32815754d25da03692629&q=london&units=metric
 */
// 4 steps of network calling
/*
 1 Create an URL
 2 Create an URLSession
 3 Give an URLSession a Task
 4 Start the Task
 */
