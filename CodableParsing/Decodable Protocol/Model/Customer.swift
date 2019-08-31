//
//  DecodableJSON_Model.swift
//  CodableParsing
//
//  Created by Anurag Kashyap on 01/09/19.
//  Copyright © 2019 Anurag Kashyap. All rights reserved.
//

import Foundation

struct Customer : Codable {
    var firstName : String
    var lastName : String
    var age : Int
}

extension Customer {
    
    // This basically tells what values we want to Encode and Decode
    private enum CodingKeys : String , CodingKey {
        case firstName
        case lastName
        case age
    }
    
    //Decode the JSON value
    init(from decoder : Decoder) throws {
        //The container contains the keys we want to encode and decode
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.firstName = try container.decode(String.self, forKey: .firstName)
        self.lastName = try container.decode(String.self, forKey: .lastName)
        self.age = try container.decode(Int.self, forKey: .age)
    }
    
    //Encode the JSON value
    func encode(from encoder : Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.firstName, forKey: .firstName)
        try container.encode(self.lastName, forKey: .lastName)
        try container.encode(self.age, forKey: .age)
    }
    
}
