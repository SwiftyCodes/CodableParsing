//
//  JsonPlaceHolderModel.swift
//  CodableParsing
//
//  Created by Anurag Kashyap on 02/09/19.
//  Copyright © 2019 Anurag Kashyap. All rights reserved.
//

import Foundation

struct UserPlaceHolderModel : Decodable {
    var id : Int
    var name : String
    var username : String
    var email : String
    var address : AddressPlaceHolderModel?
    var phone : String
    var website : String
    var company : CompanyPlaceHolderModel?
}

struct AddressPlaceHolderModel : Decodable {
    var street : String
    var suite : String
    var city : String
    var zipcode : String
    var geo : GeoPlaceHolderModel?
}

struct GeoPlaceHolderModel : Decodable {
    var latitude : String
    var longitude : String
    
    //Mapping Custom Keys
    private enum CodingKeys : String , CodingKey {
        case latitude = "lat"
        case longitude = "lng"
    }
    
    init(from decoder : Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.latitude = try container.decode(String.self, forKey: .latitude)
        self.longitude = try container.decode(String.self, forKey: .longitude)
        
    }
}

struct CompanyPlaceHolderModel : Decodable {
    var companyName : String
    var catchPhrase : String
    var bs : String
    
    //Mapping Custom Keys
    private enum CodingKeys : String , CodingKey {
        case companyName = "name"
        case catchPhrase
        case bs
    }
    
    init(from decoder : Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.companyName = try container.decode(String.self, forKey: .companyName)
        self.catchPhrase = try container.decode(String.self, forKey: .catchPhrase)
        self.bs = try container.decode(String.self, forKey: .bs)
    }
}
