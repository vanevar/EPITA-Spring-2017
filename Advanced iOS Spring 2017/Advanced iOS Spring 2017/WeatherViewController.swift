//
//  WeatherViewController.swift
//  Advanced iOS Spring 2017
//
//  Created by vanessa vargas on 6/1/17.
//  Copyright © 2017 ___AdvancediOS___. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    var weather = Weather(city: "", temperature: 0, picture: nil )
  
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var tempLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = weather?.picture
        cityLbl.text = weather?.city
        tempLbl.text = String(describing: weather!.temperature)
   }
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
