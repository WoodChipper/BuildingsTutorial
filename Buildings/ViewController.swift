//
//  ViewController.swift
//  Buildings
//
//  Created by Don Gordon on 1/1/17.
//  Copyright © 2017 DGsolutions. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation
import MapKit


class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()


        Alamofire.request("http://www.electronicarmory.com/projects/json/buildings.json").responseString { response in

        do {
                let jsonString = response.result.value!
                let jsonData = jsonString.data(using: .utf8)!
                let jsonArray = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions()) as! NSArray

                for (index, jsonObject) in jsonArray.enumerated() {
                    let currentBuilding:Dictionary = jsonObject as! Dictionary<String, AnyObject>
                    
                    let NAME_KEY = "name"
                    let LOCATION_KEY = "location"
                    let DESCRIPTION_KEY = "description"
                    let LATITUDE_KEY = "latitude"
                    let LONGITUDE_KEY = "longitude"
                    
                    let nameString: String = currentBuilding[NAME_KEY] as! String
                    let descriptionString: String = currentBuilding[DESCRIPTION_KEY] as! String
                    
                    let locationDictionary:Dictionary = currentBuilding[LOCATION_KEY] as! Dictionary<String, Double>
                    let latitude:Double = locationDictionary[LATITUDE_KEY]! as! Double
                    let longitude:Double = locationDictionary[LONGITUDE_KEY]! as! Double
                    
                    let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
                    
                    let currentMapPin:MapPin = MapPin(title: nameString, subtitle: descriptionString, coordinate: location)
                    
                    self.mapView.addAnnotation(currentMapPin)
                    
                }

            
            
            } catch {
            print("error")
            }
        }
    }
    
    // Get JSON data
    func loadJson(forFilename fileName: String) -> NSDictionary? {
        
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            if let data = NSData(contentsOf: url) {
                do {
                    let dictionary = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as? NSDictionary
                    
                    return dictionary
                } catch {
                    print("Error!! Unable to Parse \(fileName).json")
                }
            }
            print("Error!! Unable to Parse \(fileName).json")
        }
        return nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

