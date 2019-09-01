//
//  JsonToFlatModelVC.swift
//  CodableParsing
//
//  Created by Anurag Kashyap on 01/09/19.
//  Copyright © 2019 Anurag Kashyap. All rights reserved.
//

import UIKit

class JsonToFlatModelVC: UIViewController {
    
let jsonData :Data = """

{

    "id": 1,
    "name": "Leanne Graham",
    "username": "Bret",
    "email": "Sincere@april.biz",
    "address": {
    "street": "Kulas Light",
    "suite": "Apt. 556",
    "city": "Gwenborough",
    "zipcode": "92998-3874",
    }

}

""".data(using: .utf8)!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = try? JSONDecoder().decode(UseFlatModel.self, from: jsonData) {
            print(user.name!)
            print(user.userName!)
            print(user.street!)
            print(user.zipCode)
        }
    }
}
