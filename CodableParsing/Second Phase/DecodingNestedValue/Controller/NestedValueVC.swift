//
//  NestedValueVC.swift
//  CodableParsing
//
//  Created by Anurag Kashyap on 01/09/19.
//  Copyright © 2019 Anurag Kashyap. All rights reserved.
//

import UIKit

class NestedValueVC: UIViewController {
    
let nestedJSON = """

{
   "customers":[
        {
            "firstName"  : "Anurag",
            "lastName"   : "Kashyap",
            "address"    : {
                            
                    "street": "20/213",
                    "city"  : "New Delhi",
                    "state" : "Delhi",
                    "geo"   : {
                            "lat": 34.21,
                            "lng": 23.12
                }
            }
        }
    ]
}

""".data(using: .utf8)!

    override func viewDidLoad() {
        super.viewDidLoad()

        let customer = try! JSONDecoder().decode(CustomerResponseModel.self, from: nestedJSON)
        print(customer)
    }
}
