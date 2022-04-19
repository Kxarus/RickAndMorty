//
//  NetworkManager.swift
//  NetworkManager
//
//  Created by Roman Kiruxin on 19.04.2022.
//

import Foundation

class NetworkManager {
    
    static var page = 1
    
    static func fetchData(completion: @escaping (RMCharacterInfoModel) -> ()) {
        
        let jsonUrl = "https://rickandmortyapi.com/api/character?page=\(page)"
        
        guard let url = URL(string: jsonUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
                
            guard let data = data else { return }
            
            do {
                let characters = try JSONDecoder().decode(RMCharacterInfoModel.self, from: data)
                
                DispatchQueue.main.async {
                    completion(characters)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
