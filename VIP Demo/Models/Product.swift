//
//  Product.swift
//  VIP Demo
//
//  Created by Gurung Bishow on 7/4/19.
//  Copyright © 2019 Gurung Bishow. All rights reserved.
//

import Foundation

struct Product: Codable {
    var name = ""
    var price = 0.0
    var imgUrl = ""
    
    private enum CodingKeys: String, CodingKey {
        case name
        case price
        case imgUrl
    }
}
