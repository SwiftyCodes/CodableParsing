//
//  NestedCustomerModel.swift
//  CodableParsing
//
//  Created by Anurag Kashyap on 01/09/19.
//  Copyright © 2019 Anurag Kashyap. All rights reserved.
//

import Foundation

struct GeoResponseModel : Decodable {
    var geo : GeoModel
}

struct GeoModel : Decodable {
    var latitude : Double
    var longitude : Double
    
    private enum CodingKeys : String, CodingKey {
        case latitude = "lat"
        case longitude = "lng"
    }
}

struct AddressResonseModel : Decodable {
    var address : AddressModel
}

struct AddressModel : Decodable {
    var street : String
    var city : String
    var state : String
    var geo: GeoModel?
    
    private enum CodingKeys : String, CodingKey {
        case street
        case city
        case state
        case geo
    }
}

struct CustomerResponseModel : Decodable {
    var customers : [CustomerModel]
}
struct CustomerModel : Decodable {
    var firstName : String
    var lastName : String
    var address : AddressModel?
    
    private enum CodingKeys : String, CodingKey {
        case firstName
        case lastName
        case address
    }
}
