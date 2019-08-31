//
//  JsonModel.swift
//  CodableParsing
//
//  Created by Anurag Kashyap on 31/08/19.
//  Copyright © 2019 Anurag Kashyap. All rights reserved.
//

import Foundation

struct JsonModel {
    
    var firstName : String
    var lastName : String!
    var age : Int
}

extension JsonModel {
    init?(userDict : [String:Any]) {
        guard let firstName = userDict["firstName"] as? String, let lastName = userDict["lastName"]as? String, let age = userDict["age"] as? Int else {return nil}
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
}
