//
//  Product.swift
//  estore
//
//  Created by Nicolas Barbosa on 17/10/22.
//

import Foundation

public struct ArrayProduct: Decodable {
    var product: [Product]
}

public struct Product: Decodable {

    var id: Int
    var title: String
    var price: Float
    var category: String
    var description: String
    var image: String
}
