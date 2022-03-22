//
//  Service.swift
//  MVVM app
//
//  Created by Владимир on 22.03.2022.
//

import Foundation


struct Data : Decodable {
    let body : String?
}

protocol NetworkProtocol {
    func getData(completion : @escaping (Result<[Data]?,Error>) -> Void)
}

class Network : NetworkProtocol {
    static let shared = Network()
    
    func getData(completion: @escaping (Result<[Data]?, Error>) -> Void) {
        let urlstr = "https://jsonplaceholder.typicode.com/comments"
        guard let url = URL(string: urlstr) else {return}
        URLSession.shared.dataTask(with: url) {data, _, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                do {
                    let data = try JSONDecoder().decode([Data].self, from: data!)
                    completion(.success(data))
                } catch {
                    completion(.failure(error))
                }
        }.resume()
    
    }
}
