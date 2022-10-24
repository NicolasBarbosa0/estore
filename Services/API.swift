//
//  API.swift
//  estore
// 
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
    public convenience init (session: URLSession = .shared) {
        self.init(session: session)
    }
}
