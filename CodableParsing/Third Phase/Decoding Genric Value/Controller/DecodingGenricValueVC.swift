//
//  DecodingGenricValueVC.swift
//  CodableParsing
//
//  Created by Anurag Kashyap on 01/09/19.
//  Copyright © 2019 Anurag Kashyap. All rights reserved.
//

import UIKit

//This is Arbitary Decoding!!!!!
//Stratergy - Type Eraser - Hiding the actual types behind our own custom protocol type, here it is GenericCodableJSON
struct GenricCodableJSON : Decodable {
    
    let value : Any
    
    init<T>(_ value: T?) {
        self.value = value ?? () //Empty closure
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let string = try? container.decode(String.self){
            self.init(string)
        }else if let intValue = try? container.decode(Int.self){
            self.init(intValue)
        }else{
            self.init(())
        }
    }
}

class DecodingGenricValueVC: UIViewController {

//This JSON has any tye , like foo can have int as well, string as well. So for handling that we do Genric/Arbitary Decoding.
let genricValueJSON = """

{
    "foo": "Hello",
    "bar": 123
}

""".data(using: .utf8)!

    override func viewDidLoad() {
        super.viewDidLoad()

        let decodedData = try! JSONDecoder().decode([String:GenricCodableJSON].self, from: genricValueJSON)
        print(decodedData["bar"]?.value)
        
    }
}
