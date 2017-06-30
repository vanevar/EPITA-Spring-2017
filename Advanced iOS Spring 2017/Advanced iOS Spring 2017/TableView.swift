//
//  TableView.swift
//  Advanced iOS Spring 2017
//
//  Created by vanessa vargas on 5/17/17.
//  Copyright © 2017 ___AdvancediOS___. All rights reserved.
//

import UIKit

class TableView: UITableViewController {
    let weatherDetailSegue = "ShowWeatherDetail"
    var weatherArray = [Weather]()
  
    @IBAction func unwindToWeatherList(sender: UIStoryboardSegue){
        if let sourceViewController = sender.source as? AddCityController ,
            let weather = sourceViewController.weather {
            
            let newIndexPath = IndexPath(row: weatherArray.count, section: 0)
            weatherArray.append(weather)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherArray.append(Weather(city: "Berlin", temperature: 33, picture: UIImage(named:"Berlin"))!)
        weatherArray.append(Weather(city: "Paris", temperature: 666, picture: UIImage(named:"Paris"))!)
        weatherArray.append(Weather(city: "Tokyo", temperature: 20, picture: UIImage(named:"Tokyo"))!)
        weatherArray.append(Weather(city: "Prague", temperature: 27, picture: UIImage(named:"Prague"))!)
        weatherArray.append(Weather(city: "Oruro", temperature: 11, picture: UIImage(named:"Oruro"))!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows
        return weatherArray.count
    }

  
    // Re usage of cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell", for: indexPath) as? WeatherTableViewCell
            else {
                fatalError("error")
        }

        // Configure the cell...
        cell.cityLabel.text = weatherArray[indexPath.row].city
        cell.tempLabel.text = "\(weatherArray[indexPath.row].temperature)"
        cell.imageContainer.image = weatherArray[indexPath.row].picture
        return cell
    }
 
  
  
    // MARK: - Navigation
   
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if  segue.identifier == weatherDetailSegue,
            let destination = segue.destination as? WeatherViewController,
            let weatherIndex = tableView.indexPathForSelectedRow?.row
        {
            destination.weather = weatherArray[weatherIndex]
        }
    }

}
