//
//  JsonPlaceHolderVC.swift
//  CodableParsing
//
//  Created by Anurag Kashyap on 02/09/19.
//  Copyright © 2019 Anurag Kashyap. All rights reserved.
//

import UIKit

class JsonPlaceHolderVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUserFromApi()
    }
    
    func fetchUserFromApi(){
        let Url = URL(string: "https://jsonplaceholder.typicode.com/users")!
            URLSession.shared.dataTask(with: Url) { (data, response, error) in
                guard error == nil,let dataValue = data else { print(error!); return}
                let userData = try? JSONDecoder().decode([UserPlaceHolderModel].self, from: dataValue)
                if let user = userData{
                    for singleUser in user {
                        print(singleUser.name, ":", singleUser.address!.city, ":", singleUser.address!.geo!.latitude,":", singleUser.company!.companyName)
                    }
                }
            }.resume()
    }
}
