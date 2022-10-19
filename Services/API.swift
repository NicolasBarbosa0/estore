//
//  API.swift
//  estore
//
//  Created by Nicolas Barbosa on 17/10/22.
//

import Foundation

public final class API {
    // static let domain = "https://fakestoreapi.com/products/1"
    public static let shared = API()
    let session: URLSession

    init() {
        let config = URLSessionConfiguration.default
        session = URLSession(configuration: config)
    }

    func getProduct(completion: @escaping (Product?, Error?) -> Void) {
        let url = URL(string: "https://fakestoreapi.com/products/1")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        // let urlRequest = URLRequest(url: URL(string: API.domain)!)
        let task = session.dataTask(with: request) { (data: Data?, _: URLResponse?, error: Error?) in
            do {

                let product = try JSONDecoder().decode(Product.self, from: data!)
                DispatchQueue.main.async {
                    completion(product, nil)
                }
            } catch let error {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }
        task.resume()
    }
}
