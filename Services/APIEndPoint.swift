//
//  APIEndPoint.swift
//  estore
//
//  Created by Nicolas Barbosa on 21/10/22.
//

import Foundation

enum APIEndpoint: String {
    case showProduct = "/products"
    func url(for baseURL: URL) -> URL {
        return baseURL.appendingPathComponent(rawValue)
    }
}

extension APIEndpoint: CaseIterable { }
