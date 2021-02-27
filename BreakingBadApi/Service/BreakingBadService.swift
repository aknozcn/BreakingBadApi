//
//  BreakingBadService.swift
//  BreakingBadApi
//
//  Created by sh3ll on 14.02.2021.
//

import Foundation

class BreakingBadService {

    static func getCharacters(parameters: String, characterId: String?, completion: @escaping ([Chars]) -> Void) {

        let url: String = "\(BreakingBadApiConstants.baseURL)\(parameters)\(characterId ?? "")"

        print("[Started] getCharacters() url == ", url)

        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in

                guard let data = data, error == nil else { return }
            
                do {
                    let response: [Chars] = try JSONDecoder().decode([Chars].self, from: data)


                    DispatchQueue.global(qos: .background).async {
                        completion(response)
                    }
                    print("[Success] getCharacters() [Character].count == ", response.count)

                } catch {

                    print("[Error] getCharacters() ==", error.localizedDescription)
                }
            }).resume()
    }
}

