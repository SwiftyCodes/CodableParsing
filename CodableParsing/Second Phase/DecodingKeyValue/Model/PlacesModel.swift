//
//  UserModel.swift
//  CodableParsing
//
//  Created by Anurag Kashyap on 01/09/19.
//  Copyright © 2019 Anurag Kashyap. All rights reserved.
//

import Foundation

struct PlacesResponseModel : Decodable {
    var places : [PlacesModel]
}

struct PlacesModel : Codable {
    var name : String
    var latitude : Double
    var longitute : Double
}

extension PlacesModel {
    
    // This basically tells what values we want to Encode and Decode
    private enum CodingKeys : String , CodingKey {
        case name
        case latitude
        case longitute
    }
    
    //Decode the JSON value
    init(from decoder : Decoder) throws {
        //The container contains the keys we want to encode and decode
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.latitude = try container.decode(Double.self, forKey: .latitude)
        self.longitute = try container.decode(Double.self, forKey: .longitute)
    }
    
    //Encode the JSON value
    func encode(from encoder : Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.latitude, forKey: .latitude)
        try container.encode(self.longitute, forKey: .longitute)
    }
    
}
