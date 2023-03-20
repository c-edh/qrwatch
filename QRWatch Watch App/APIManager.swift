//
//  APIManager.swift
//  QRWatch Watch App
//
//  Created by Corey Edh on 3/7/23.
//

import Foundation


class APIManager{
    var bearToken: String?
    
    var task : URLSessionDataTask?
    func getData(url: APIEndPoints, for parameters: [String: Any]? = nil, completion: @escaping (Result<Data, Error>) -> Void){
        
        task?.cancel()
        var request = URLRequest(url: url.url)
        request.httpMethod = "POST"
        
        if let parameters{
            let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
            request.httpBody = jsonData
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        if let bearToken{ request.setValue( "Bearer \(bearToken)", forHTTPHeaderField: "Authorization") }
        
        task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error{ completion(.failure(error)); return }
            
            guard let data else{
                completion (.failure(NSError(domain: "NilData", code: 1)))
                return
            }
            completion(.success(data))
        }
        task?.resume()
    }
}
