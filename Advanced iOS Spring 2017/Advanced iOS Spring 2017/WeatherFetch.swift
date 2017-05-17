//
//  WeatherFetch.swift
//  Advanced iOS Spring 2017
//
//  Created by Suiz Uzcategui on 27/04/2017.
//  Copyright © 2017 ___AdvancediOS___. All rights reserved.
//

import Foundation

class WeatherFetch {
    
    private let openWeatherMapBaseURL = "http://api.openweathermap.org/data/2.5/weather"
    private let openWeatherMapAPIKey = "5559b4ad4f9fc0b8ce21cd6b19a33100"
    
    func getWeather(city: String) -> Data? {
      
        // This is a pretty simple networking task, so the shared session will do.
        let session = URLSession.shared
        
        let weatherRequestURL = URL(string: "\(openWeatherMapBaseURL)?APPID=\(openWeatherMapAPIKey)&q=\(city)")!
        
        // The data task retrieves the data.
        let dataTask = session.dataTask(with: weatherRequestURL) {
            (data:Data?, response:URLResponse?, error:Error?) in
            if let error = error {
                // Server has returned an error
              print("Error:\n\(error)")
            }
            else {
                // Server has returned data
                print("Raw data:\n\(data!)\n")
                let dataString = String(data: data!, encoding: String.Encoding.utf8)
                print("Human-readable data:\n\(dataString!)")
                let jsonParser = JsonParser()
                print("From weather")
                print(jsonParser.parseCity(data: data))
            }
        }
        dataTask.resume()
       return nil
    }
  
}
