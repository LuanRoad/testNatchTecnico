//
//  ApiService.swift
//  testNatch2022
//
//  Created by Luan Road on 22/04/22.
//

import Foundation

final class ApiService {
    
    /// static shared to access the method
    static let shiredService = ApiService()
    
    /// method who return all the elements from the api
    /// - Parameters:
    ///   - success: completation handler with the list of elements from the api in a list of structs
    ///   - failure: completation handler with the error from the api or decoder
    func getRequest(success: @escaping(_ result: Response) -> (), failure: @escaping(_ error: Error?)->()) {
        //https://us-central1-bibliotecadecontenido.cloudfunctions.net/helloWorld
        guard let url = URL(string: "\(Constants.urlBase)helloWorld") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let json = data else { return  }
            if let data = data {
                if let jsonString = String(data: data, encoding: .utf8) {
                    print(jsonString)
                }
            }
            do{
                let decoder = JSONDecoder()
                success(try decoder.decode(Response.self, from: json))
            }catch let error {
                failure(error)
            }
        }.resume()
    }
}
