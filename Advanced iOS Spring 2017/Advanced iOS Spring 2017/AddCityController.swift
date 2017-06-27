//
//  AddCityController.swift
//  Advanced iOS Spring 2017
//
//  Created by vanessa vargas on 6/1/17.
//  Copyright © 2017 ___AdvancediOS___. All rights reserved.
//

import UIKit
import os.log

class AddCityController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

  @IBOutlet weak var inputCity: UITextField!
  @IBOutlet weak var inputTemp: UIPickerView!
  @IBOutlet weak var inputImage: UIImageView!
  @IBOutlet weak var saveButton: UIBarButtonItem!
 
  var weather: Weather?
  var selectedTemp = 0
  let tempArray = Array(-15...40)
  
  @IBAction func cancelButton(_ sender: Any) {
    //completition is what happens when the action completes.
    dismiss(animated:true, completion:nil)
  }
  
  @IBAction func save(_ sender: Any) {
    
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    
    inputTemp.dataSource = self
    inputTemp.delegate = self

    let random = arc4random_uniform(5)
    var name = ""
    switch random {
      case 0:
        name="Berlin"
      case 1:
        name="Paris"
      case 2:
        name="Tokyo"
      case 3:
        name="Prague"
      default:
        name="Default"
    }
      inputImage.image = UIImage(named: name)
    
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
  

  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
      super.prepare(for: segue, sender: sender)
      guard let button = sender as? UIBarButtonItem, button == saveButton else{
        os_log("Save button not pressed", log: OSLog.default, type: .debug )
        return
      }
      let city = inputCity.text
      let temp = tempArray[selectedTemp]
      let image = inputImage.image
      weather = Weather(city: city!, temperature: temp, picture: image)
    }
  
  
  //PICKER
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return String(describing: tempArray[row])
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return tempArray.count
  }
  
  public func numberOfComponents(in pickerView: UIPickerView) -> Int{
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    selectedTemp = row
  }

}
  


