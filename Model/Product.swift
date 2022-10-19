//
//  Product.swift
//  estore
//
//  Created by Nicolas Barbosa on 17/10/22.
//

import Foundation

struct Product: Codable {

    var id: UUID
    var title: String?
    var price: String
    var categories: String?
    var description: String?
    var image: URL?
}
