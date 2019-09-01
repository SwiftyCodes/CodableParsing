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
    
    //Mapping Properties using Key Codings - These are only mentioned wehn we need to check this!
    private enum CodingKeys : String, CodingKey {
        //lat and lng are the keys mentioned in JSON
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
    
    //These are only mentioned wehn we need to map this from JSON coming! like adress = ADDRES
    private enum CodingKeys : String, CodingKey {
        case firstName
        case lastName
        case dateCreated
        case address = "ADDRESS"
        
    }
}
