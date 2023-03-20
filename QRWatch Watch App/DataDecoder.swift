//
//  DataDecoder.swift
//  QRWatch Watch App
//
//  Created by Corey Edh on 3/13/23.
//

import Foundation


struct DataDecoder{
    
    func decodeAPIData<T:Decodable>(decode data: Data,type: T.Type) -> T?{
        let jsonDecoder = JSONDecoder()
        do {
            
           // let dateFormatter = DateFormatter()
            //formatter.dateFormat = PUT THE FORMAT HERE
//            jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        
            let decodedData = try jsonDecoder.decode(T.self, from: data)
            return decodedData
        } catch  {
            print(error)
        }
        return nil
    }
    
}
