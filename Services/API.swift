//
//  API.swift
//  estore
// swiftlint:disable all
//  Created by Nicolas Barbosa on 17/10/22.
//

import Foundation

public final class API {
    
    public static var shared = API()
    
    public let baseURL = URL(string: "https://fakestoreapi.com")
    
    let session: HTTPSessionProtocol
    
    init(session: HTTPSessionProtocol) {
        self.session = session
    }
    
    public func getProduct() async throws -> [Product] {
        let endpoint = APIEndpoint.showProduct
        let url = endpoint.url(for: baseURL!)
        let request = URLRequest(url: url)
        let (data, _) = try await session.data(for: request)
        let product = try JSONDecoder().decode([Product].self, from: data)
        return product
    }
    
    }

extension API {
    @_disfavoredOverload
    public convenience init (session:URLSession = .shared){
        self.init(session: session)
    }
}
//    // static let domain = "https://fakestoreapi.com/products/1"
//    public static let shared = API()
//    let session: URLSession
//
//    init() {
//        let config = URLSessionConfiguration.default
//        session = URLSession(configuration: config)
//    }
//
//    public func getProduct(completion: @escaping (Product?, Error?) -> Void) {
//        let url = URL(string: "https://fakestoreapi.com/products/1")!
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//
//        print("1")
//
//        // let urlRequest = URLRequest(url: URL(string: API.domain)!)
//        let task = session.dataTask(with: request) { (data: Data?, _: URLResponse?, error: Error?) in
//
//            print("2")
//
//            do {
//                let product = try JSONDecoder().decode(Product.self, from: data!)
//                DispatchQueue.main.async {
//                    completion(product, nil)
//
//                    print("3")
//
//                }
//            } catch let error {
//                DispatchQueue.main.async {
//                    completion(nil, error)
//                }
//            }
//        }
//        task.resume()
//    }
