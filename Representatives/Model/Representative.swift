//
//  Representative.swift
//  Representatives
//
//  Created by Quinten Smith on 9/3/18.
//  Copyright © 2018 Quinten Smith. All rights reserved.
//

import Foundation

struct RepresentativeDictionary: Decodable {
    
    let results: [Representative]
    
}

struct Representative: Decodable {
    
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let link: String
}



