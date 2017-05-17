//
//  JsonParser.swift
//  Advanced iOS Spring 2017
//
//  Created by vanessa vargas on 5/10/17.
//  Copyright © 2017 ___AdvancediOS___. All rights reserved.
//

import Foundation

class JsonParser{
  
  func parseCity( data:Data? ) -> String{
     var names = String()
    do {
      if let data = data,
        let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
        let cityName = json["name"] as? String {
        names.append(cityName)
      }
    } catch {
      print("Error parsing JSON: \(error)")
    }
    print("Names")
    print(names)
    return names
 
  }
}
