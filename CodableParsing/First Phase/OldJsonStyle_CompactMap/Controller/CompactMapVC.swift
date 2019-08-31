//
//  ViewController.swift
//  CodableParsing
//
//  Created by Anurag Kashyap on 31/08/19.
//  Copyright © 2019 Anurag Kashyap. All rights reserved.
//

import UIKit

class CompactMapVC: UIViewController {
    
    
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
    },
    {
        "firstName":"Geeta",
        "lastName":"Kashyap",
        "age": 51
    }
 ]


""".data(using: .utf8)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataFromJSON()
    }
    
    func fetchDataFromJSON(){
        //Old way of parsing json data
        if let usersArray = try! JSONSerialization.jsonObject(with: jsonValue, options: .allowFragments) as? [[String:Any]] {
            let users = usersArray.compactMap(JSONModel.init) // Gets single dictinory value
            print(users)
        }
    }
}

