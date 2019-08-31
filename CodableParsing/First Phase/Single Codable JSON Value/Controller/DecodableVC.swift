//
//  DecodableVC.swift
//  CodableParsing
//
//  Created by Anurag Kashyap on 01/09/19.
//  Copyright © 2019 Anurag Kashyap. All rights reserved.
//

import UIKit

class DecodableVC: UIViewController {
    
    let json = """
    {
        "firstName" : "Anurag",
        "lastName"  : "Kashyap",
        "age"       : 27
    }
""".data(using: .utf8)!

    override func viewDidLoad() {
        super.viewDidLoad()

        //Decoding from JSON
        let user = try! JSONDecoder().decode(Customer.self, from: json)
        print(user)
        
        //Encoding to JSON
        let customerValue = Customer(firstName: "Anurag", lastName: "Kashyap", age: 27)
        let encodedCustomer = try! JSONEncoder().encode(customerValue)
        print(encodedCustomer)
        
        let humanRedableValue = String(data: encodedCustomer, encoding: .utf8)!
        print(humanRedableValue as Any)
    }
    
}
