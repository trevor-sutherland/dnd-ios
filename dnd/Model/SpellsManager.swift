//
//  SpellsManager.swift
//  dnd
//
//  Created by Trevor Sutherland on 9/23/24.
//

import Foundation

struct SpellsManager {
    let dndBase = "https://www.dnd5eapi.co/api"
    let classesURL = "/classes"
    let spellsURL = "/spells"
    
    func fetchSpellsByClass(dndClassName: String) {
        let urlString = "\(dndBase)\(classesURL)/\(dndClassName)\(spellsURL)"
        performRequest(urlString: urlString)
        print(urlString)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    let dataString = String(data: safeData, encoding: .utf8)
                    self.parseJSON(spellData: safeData)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(spellData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(SpellData.self, from: spellData)
            print(decodedData.results[0].name)
        } catch {
            print(error)
        }

    }
}
