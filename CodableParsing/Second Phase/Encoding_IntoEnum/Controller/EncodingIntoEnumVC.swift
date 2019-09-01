//
//  EncodingIntoEnumVC.swift
//  CodableParsing
//
//  Created by Anurag Kashyap on 01/09/19.
//  Copyright © 2019 Anurag Kashyap. All rights reserved.
//

import UIKit

class EncodingIntoEnumVC: UIViewController {
//dateCreated - Is in the ISO8601 format, And is the acceptable format if we want to decode the date using Codable, if not available then we have to convert the date into this format
let nestedEnumJSON = """

{
   "customers":[
        {
            "first_name"  : "Anurag",
            "lastName"   : "Kashyap",
            "dateCreated": "05/17/1992",
            "ADDRESS"    : {
                            
                    "street": "20/213",
                    "city"  : "New Delhi",
                    "state" : "Delhi",
                    "geo"   : {
                            "lat": 34.21,
                            "lng": 23.12
                },
                "addressType"   : "condo"
            }
        }
    ]
}

""".data(using: .utf8)!

    override func viewDidLoad() {
        super.viewDidLoad()
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.decodableDate)
        decoder.keyDecodingStrategy = .convertFromSnakeCase // Handles the key having key snake composition like in this case JSON's first_name
        let customer = try! decoder.decode(CustomerEnumResponseModel.self, from: nestedEnumJSON)
        print(customer.customers[0])
        
    }
}

extension DateFormatter {
    static let decodableDate : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter
    }()
}
