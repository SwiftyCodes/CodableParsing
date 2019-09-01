//
//  UseFlatModel.swift
//  CodableParsing
//
//  Created by Anurag Kashyap on 01/09/19.
//  Copyright © 2019 Anurag Kashyap. All rights reserved.
//

import Foundation

class UseFlatModel :Decodable {
    
    var id :Int!
    var name :String!
    var userName :String!
    var email :String!
    
    var street :String!
    var suite :String!
    var city :String!
    var zipCode :String!
    
    private enum UserKeys :String, CodingKey {
        
        case id
        case name
        case userName = "username"
        case email
        case address
    }
    
    private enum AddressKeys :String, CodingKey {
        
        case street
        case suite
        case city
        case zipCode = "zipcode"
        
    }
    
    required init(from decoder :Decoder) throws {
        
        if let userContainer = try? decoder.container(keyedBy: UserKeys.self) {
            
            self.id = try! userContainer.decode(Int.self, forKey: .id)
            self.name = try! userContainer.decode(String.self, forKey: .name)
            self.userName = try! userContainer.decode(String.self, forKey: .userName)
            self.email = try! userContainer.decode(String.self, forKey: .email)
            
            // address nested container
            if let addressContainer = try? userContainer.nestedContainer(keyedBy: AddressKeys.self, forKey: .address) {
                
                self.street = try! addressContainer.decode(String.self, forKey: .street)
                self.suite = try! addressContainer.decode(String.self, forKey: .suite)
                self.city = try! addressContainer.decode(String.self, forKey: .city)
                self.zipCode = try! addressContainer.decode(String.self, forKey: .zipCode)
            }
        }
    }
}

