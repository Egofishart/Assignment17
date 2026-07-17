//
//  FunFactManager.swift
//  ნ.დანელია დავალება 17
//
//  Created by NikoDanelia on 16/07/2026.
//

import Foundation

protocol FunFactAPIManagerProtocol {
    func getRandomFact(category: String, completion: @escaping (FunFact?) -> Void)
}

class FunFactAPIManager: FunFactAPIManagerProtocol {
    func getRandomFact(category: String, completion: @escaping (FunFact?) -> Void) {
        guard let url = URL(string:"https://api.chucknorris.io/jokes/random?category=\(category)") else{ return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error)
            }
            
            guard let data  else {return}
            
            do {
                let decodedResponse = try JSONDecoder().decode(FunFact.self, from: data)
                DispatchQueue.main.async {
                    completion(decodedResponse)
                }
                
            } catch {
                print(error)
                
            }
        }.resume()
    }
}
