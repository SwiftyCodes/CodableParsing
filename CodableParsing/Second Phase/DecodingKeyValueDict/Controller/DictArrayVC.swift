//
//  DictArrayVC.swift
//  CodableParsing
//
//  Created by Anurag Kashyap on 01/09/19.
//  Copyright © 2019 Anurag Kashyap. All rights reserved.
//

import UIKit

class DictArrayVC: UIViewController {
    
let placesJson = """

{
   "places":[
        {
            "name":"Agra",
            "latitude":34.67,
            "longitute": 27.54
        },
        {
            "name":"Delhi",
            "latitude":45.6,
            "longitute": 22.2
        },
        {
            "name":"Kolkata",
            "latitude":66.2,
            "longitute": 24.2
        }
    ]
 }

""".data(using: .utf8)!


    override func viewDidLoad() {
        super.viewDidLoad()
     
        let placesResonse = try! JSONDecoder().decode(PlacesResponseModel.self, from: placesJson)
        print(placesResonse.places)
    }

}
