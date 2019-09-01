//
//  NestedEnumJSON.swift
//  CodableParsing
//
//  Created by Anurag Kashyap on 01/09/19.
//  Copyright © 2019 Anurag Kashyap. All rights reserved.
//
import Foundation

enum AddressType : String, Decodable {
    case apartment = "apartment"
    case house = "house"
    case townHouse = "townHouse"
    case condo = "condo"
}

struct GeoEnumResponseModel : Decodable {
    var geo : GeoEnumModel
}

struct GeoEnumModel : Decodable {
    var latitude : Double
    var longitude : Double
    
    private enum CodingKeys : String, CodingKey {
        case latitude = "lat"
        case longitude = "lng"
    }
}

struct AddressEnumResonseModel : Decodable {
    var address : AddressEnumModel
    
}

struct AddressEnumModel : Decodable {
    var street : String
    var city : String
    var state : String
    var geo: GeoEnumModel?
    var addressType : AddressType?
    
    private enum CodingKeys : String, CodingKey {
        case street
        case city
        case state
        case geo
        case addressType
    }
}

struct CustomerEnumResponseModel : Decodable {
    var customers : [CustomerEnumModel]
}

struct CustomerEnumModel : Decodable {
    var firstName : String
    var lastName : String
    var dateCreated : Date
    var address : AddressEnumModel?
    
    private enum CodingKeys : String, CodingKey {
        case firstName
        case lastName
        case dateCreated
        case address
        
    }
}
