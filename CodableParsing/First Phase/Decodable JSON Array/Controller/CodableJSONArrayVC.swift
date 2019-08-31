//
//  CodableJSONArrayVC.swift
//  CodableParsing
//
//  Created by Anurag Kashyap on 01/09/19.
//  Copyright © 2019 Anurag Kashyap. All rights reserved.
//

import UIKit

class CodableJSONArrayVC: UIViewController {
    
    let jsonValue = """

 [
    {
        "firstName":"Anurag",
        "lastName":"Kashyap",
        "age": 27
    },
    {
        "firstName":"Himanshu",
        "lastName":"Raj",
        "age": 27
    },
    {
        "firstName":"Rashi",
        "lastName":"Banerji",
        "age": 24
    }
 ]

""".data(using: .utf8)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Decoding from JSON -> Customer Model is Array here now
        let users = try! JSONDecoder().decode([Customer].self, from: jsonValue)
        for singleUser in users {
            print(singleUser.firstName, ":", singleUser.lastName, ":", singleUser.age)
        }
    }
}
