//
//  SharedAPI.swift
//  DigioTest
//
//  Created by Douglas Schiavi on 24/06/22.
//

import Foundation

class SharedAPI {
    
    let url = URL(string: "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products")
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    typealias ParseResponse<T> = (Result<T?, Error>) -> Void
    
    func getProducts(completion: @escaping ParseResponse<ProductList>) {
        dataTask?.cancel()
        
        guard let url = url else { return }
        
        dataTask = defaultSession.dataTask(with: url) { [weak self] data, response, error in
            defer {
                self?.dataTask = nil
            }
            
            if let error = error {
                completion(.failure(error))
            } else if
                let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                
                do {
                    let decodedData = try ProductList.decode(with: JSONDecoder(), from: data)
                    completion(.success(decodedData))
                }
                catch {
                    let error: Error = NSError(domain: "Decode error", code: 500)
                    completion(.failure(error))
                }
                
            }
        }
        dataTask?.resume()
    }
}
