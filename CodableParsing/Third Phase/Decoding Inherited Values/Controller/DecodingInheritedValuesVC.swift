//
//  DecodingInheritedValuesVC.swift
//  CodableParsing
//
//  Created by Anurag Kashyap on 01/09/19.
//  Copyright © 2019 Anurag Kashyap. All rights reserved.
//

import UIKit


class Car: Decodable {
    var make : String
    var model : String
}

//Inherited Class
class ElectricCar: Car {
    var range : Double
    var hasAutoPilot : Bool
    
    private enum CodingKeys : String, CodingKey {
        case range = "range"
        case hasAutoPilot = "hasAutoPilot"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.range = try container.decode(Double.self, forKey: .range)
        self.hasAutoPilot = try container.decode(Bool.self, forKey: .hasAutoPilot)
        try super.init(from: decoder) // If this is not called Noting will be initialized
    }
}

class DecodingInheritedValuesVC: UIViewController {
    
let jsonValue = """

{
    "make": "Tesla",
    "model": "Model X",
    "range": 400,
    "hasAutoPilot": true
}

""".data(using: .utf8)!

    override func viewDidLoad() {
        super.viewDidLoad()
            let electricCar = try! JSONDecoder().decode(ElectricCar.self, from: jsonValue)
        print(electricCar.make, ":", electricCar.model, ":", electricCar.range, ":", electricCar.hasAutoPilot)
        
    }
}
